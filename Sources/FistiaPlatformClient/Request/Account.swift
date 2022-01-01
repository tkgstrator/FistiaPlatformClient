//
//  File.swift
//  
//
//  Created by devonly on 2022/01/02.
//

import Foundation
import Alamofire

public enum Account {
    public enum Twitter {
        public final class Link: RequestType {
            public typealias ResponseType = Response.Account.Twitter
            
            public var method: HTTPMethod = .post
            public var path: String
            public var parameters: Parameters?
            init(userId: String) {
                self.path = "users/\(userId)/twitter_account"
            }
        }
        
        public final class Delete: RequestType {
            public typealias ResponseType = Response.Empty
            
            public var method: HTTPMethod = .delete
            public var path: String
            public var parameters: Parameters?
            init(userId: String) {
                self.path = "users/\(userId)/twitter_account"
            }
        }
    }
    
    public enum Damtomo {
        public final class Link: RequestType {
            public typealias ResponseType = Response.Account.Damtomo
            
            public var method: HTTPMethod = .post
            public var path: String
            public var parameters: Parameters?
            init(userId: String, username: String, password: String) {
                self.path = "users/\(userId)/dam_tomo_account"
                self.parameters = [
                    "username": username,
                    "password": password
                ]
            }
        }
        
        public final class Get: RequestType {
            public typealias ResponseType = Response.Account.Damtomo
            
            public var method: HTTPMethod = .get
            public var path: String
            public var parameters: Parameters?
            init(userId: String, email: String) {
                self.path = "users/\(userId)/dam_tomo_account"
                self.parameters = [
                    "email": email
                ]
            }
        }
        
        public final class Delete: RequestType {
            public typealias ResponseType = Response.Account.Damtomo
            
            public var method: HTTPMethod = .post
            public var path: String
            public var parameters: Parameters?
            init(userId: String) {
                self.path = "users/\(userId)/dam_tomo_account"
            }
        }
    }
}
