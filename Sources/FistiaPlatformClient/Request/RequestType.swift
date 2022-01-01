//
//  RequestType.swift
//  FistiaPlatformClient
//
//  Created by devonly on 2022/01/02.
//

import Foundation
import Alamofire

public protocol RequestType {
    associatedtype ResponseType: Codable
    
    var method: HTTPMethod { get }
    var path: String { get}
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension RequestType {
    
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
    public func asURLRequest(environment: Environment) throws -> URLRequest {
        do {
            let url = URL(string: environment.rawValue)!.appendingPathComponent(path)
            let urlRequest = try URLRequest(url: url, method: method, headers: nil)
            return try encoding.encode(urlRequest, with: parameters)
        } catch(let error) {
            throw AFError.createURLRequestFailed(error: error)
        }
    }
}
