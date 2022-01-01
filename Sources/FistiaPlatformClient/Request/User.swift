//
//  User.swift
//  FistiaPlatformClient
//
//  Created by devonly on 2022/01/02.
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
        init(userId: String, newUserId: String?, email: String?, name: String?, password: String?, authority: String?, avatarData: String?) {
            self.path = "users/\(userId)"
            self.parameters = [
                "email": email,
                "id": newUserId,
                "name": name,
                "password": password,
                "authority": authority,
                "avatarData": avatarData
            ].compactMapValues({ $0 })
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
