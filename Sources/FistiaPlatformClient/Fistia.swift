//
//  Fistia.swift
//  FistiaPlatformClient
//
//  Created by devonly on 2022/01/02.
//

import Foundation
import Alamofire
import Combine
import KeychainAccess

open class Fistia: RequestInterceptor {
    internal let session: Alamofire.Session = {
        let session = Alamofire.Session()
        session.sessionConfiguration.httpMaximumConnectionsPerHost = 1
        session.sessionConfiguration.timeoutIntervalForRequest = 10
        return session
    }()
    internal let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    internal var task: Set<AnyCancellable> = Set<AnyCancellable>()
    internal let environment: Environment
    internal let keychain: Keychain
    internal let oauthURL: URL
    
    public init(environment: Environment = .development) {
        self.environment = environment
        self.keychain = Keychain(server: environment.rawValue, protocolType: .https)
        self.oauthURL = URL(string: environment.rawValue)!.appendingPathComponent("auth/twitter")
        print(oauthURL)
    }
    
    internal func publish<T: RequestType>(_ request: T) -> AnyPublisher<T.ResponseType, AFError> {
        guard let request = try? request.asURLRequest(environment: environment) else {
            return Fail(outputType: T.ResponseType.self, failure: AFError.createURLRequestFailed(error: FistiaError.credential))
                .eraseToAnyPublisher()
        }
        
        return session.request(request, interceptor: self)
            .validate()
            .validate(contentType: ["application/json"])
            .publishDecodable(type: T.ResponseType.self, decoder: decoder)
            .value()
    }
    
    internal func authorize<T: RequestType>(_ request: T)  -> AnyPublisher<T.ResponseType, AFError> {
        guard let request = try? request.asURLRequest(environment: environment) else {
            return Fail(outputType: T.ResponseType.self, failure: AFError.createURLRequestFailed(error: FistiaError.credential))
                .eraseToAnyPublisher()
        }
        
        return session.request(request)
            .cURLDescription { request in
                print(request)
            }
            .validate()
            .validate(contentType: ["application/json"])
            .publishDecodable(type: T.ResponseType.self, decoder: decoder)
            .value()
    }
    
    public func authorize(userId: String, password: String, completion: @escaping (Swift.Result<Bool, AFError>) -> Void) {
        authorize(Auth.Local(idOrEmailAddress: userId, password: password))
            .sink(receiveCompletion: { result in
                switch result {
                    case .finished:
                        completion(.success(true))
                    case .failure(let error):
                        completion(.failure(error))
                }
            }, receiveValue: { [self] response in
                keychain.setValue(response.authToken)
            })
            .store(in: &task)
    }
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Swift.Result<URLRequest, Error>) -> Void) {
        guard let bearerToken = keychain.getValue() else {
            completion(.failure(AFError.createURLRequestFailed(error: FistiaError.credential)))
            return
        }
        var urlRequest = urlRequest
        urlRequest.headers.add(.authorization(bearerToken: bearerToken))
        completion(.success(urlRequest))
    }
//
//    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
//
//    }
}
