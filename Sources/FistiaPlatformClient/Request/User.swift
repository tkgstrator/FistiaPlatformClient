//
//  File.swift
//  
//
//  Created by devonly on 2022/01/01.
//

import Foundation
import Alamofire

public enum User {
    public final class Find: RequestType {
        public typealias ResponseType = Response.User
        
        public var method: HTTPMethod = .get
        public var path: String
        public var parameters: Parameters?
        init(userId: String) {
            self.path = "users/\(userId)"
        }
    }
    
    public final class Update: RequestType {
        public typealias ResponseType = Response.User
        
        public var method: HTTPMethod = .patch
        public var path: String
        public var parameters: Parameters?
        init(userId: String, email: String, name: String, password: String, authority: String, avatarData: String) {
            self.path = "users/\(userId)"
            self.parameters = [
                "email": email,
                "id": userId,
                "name": name,
                "password": password,
                "authority": authority,
                "avatarData": avatarData
            ]
        }
    }
    
    public final class Delete: RequestType {
        public typealias ResponseType = Response.Empty
        
        public var method: HTTPMethod = .delete
        public var path: String
        public var parameters: Parameters?
        init(userId: String) {
            self.path = "users/\(userId)"
        }
    }
}
