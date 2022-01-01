//
//  Auth.swift
//  FistiaPlatformClient
//
//  Created by devonly on 2022/01/02.
//

import Foundation
import Alamofire

public enum Auth {
    public final class Local: RequestType {
        public typealias ResponseType = Response.Auth.Local
        
        public var method: HTTPMethod = .post
        public var path: String = "auth/local"
        public var parameters: Parameters?
        
        init(idOrEmailAddress: String, password: String) {
            self.parameters = [
                "idOrEmailAddress": idOrEmailAddress,
                "password": password
            ]
        }
    }
    
    public final class RequestResetPassword: RequestType {
        public typealias ResponseType = Response.Empty
        
        public var method: HTTPMethod = .post
        public var path: String = "auth/_request_reset_password"
        public var parameters: Parameters?
        init(email: String) {
            self.parameters = [
                "email": email
            ]
        }
    }
    
    public final class ResetPassword: RequestType {
        public typealias ResponseType = Response.Empty
        
        public var method: HTTPMethod = .post
        public var path: String = "auth/_reset_password"
        public var parameters: Parameters?
        init(verificationCode: String, newPassword: String) {
            self.parameters = [
                "verificationCode": verificationCode,
                "newPassword": newPassword
            ]
        }
    }
    
    public final class Twitter: RequestType {
        public typealias ResponseType = Response.Empty
        
        public var method: HTTPMethod = .get
        public var path: String = "auth/twitter"
        public var parameters: Parameters?
        init() {}
    }
    
    public final class Whoami: RequestType {
        public typealias ResponseType = Response.User
        
        public var method: HTTPMethod = .get
        public var path: String = "auth/whoami"
        public var parameters: Parameters?
        init() {}
    }
}

