//
//  Result.swift
//  FistiaPlatformClient
//
//  Created by devonly on 2022/01/02.
//

import Foundation
import Alamofire

public enum Result {
    public enum Ranbato {
        public final class Find: RequestType {
            public typealias ResponseType = Response.Result.Ranbato
            public var method: HTTPMethod = .get
            public var path: String
            public var parameters: Parameters?
            init(userId: String, start: Int = 0, limit: Int = 25, q: String = "", ordering: String = "") {
                self.path = "users/\(userId)/dam_ranking_battle_results"
                self.parameters = [
                    "start": start,
                    "limit": limit,
                    "q": q,
                    "ordering": ordering
                ]
            }
        }
    }
}
