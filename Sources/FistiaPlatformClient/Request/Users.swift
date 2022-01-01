//
//  Users.swift
//  FistiaPlatformClient
//
//  Created by devonly on 2022/01/02.
//

import Foundation
import Alamofire

public enum Users {
    public final class Find: RequestType {
        public typealias ResponseType = Response.Users
        
        public var method: HTTPMethod = .get
        public var path: String = "users"
        public var parameters: Parameters?
        init(start: Int = 0, limit: Int = 25, q: String = "", ordering: String = "") {
            self.parameters = [
                "start": start,
                "limit": limit,
                "q": q,
                "ordering": ordering
            ]
        }
    }
    
    public final class Create: RequestType {
        public typealias ResponseType = Response.Users
        
        public var method: HTTPMethod = .post
        public var path: String = "users"
        public var parameters: Parameters?
        init(userId: String, email: String, name: String, password: String, authority: String?, avatarData: String?) {
            self.parameters = [
                "email": email,
                "id": userId,
                "name": name,
                "password": password,
                "authority": authority,
                "avatarData": avatarData
            ].compactMapValues({ $0 })
        }
    }
}
