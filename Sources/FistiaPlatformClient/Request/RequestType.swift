//
//  RequestType.swift
//  FistiaPlatformClient
//
//  Created by devonly on 2022/01/02.
//

import Foundation
import Alamofire

public protocol RequestType: URLRequestConvertible {
    associatedtype ResponseType: Codable
    
    var method: HTTPMethod { get }
    var path: String { get}
    var baseURL: URL { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension RequestType {
    /// 基本URL
    public var baseURL: URL {
        URL(string: "https://api.fistia.jp")!
    }
    
    /// エンコーディング
    public var encoding: ParameterEncoding {
        switch method {
            case .get:
                return URLEncoding.queryString
            case .post, .delete, .patch:
                return JSONEncoding.default
            default:
                return JSONEncoding.default
        }
    }
    
    /// URLRequest
    public func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        let urlRequest = try URLRequest(url: url, method: method, headers: nil)
        return try encoding.encode(urlRequest, with: parameters)
    }
}
