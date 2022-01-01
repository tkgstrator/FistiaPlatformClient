//
//  Fistia+Account.swift
//  FistiaPlatformClient
//
//  Created by devonly on 2022/01/02.
//

import Foundation
import Combine
import Alamofire

extension Fistia {
    public func signInWithPassword(userId idOrEmailAddress: String, password: String) -> AnyPublisher<Response.Auth.Local, AFError> {
        authorize(Auth.Local(idOrEmailAddress: idOrEmailAddress, password: password))
    }
}
