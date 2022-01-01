//
//  Fistia+Result.swift
//  FistiaPlatformClient
//
//  Created by devonly on 2022/01/02.
//

import Foundation
import Alamofire
import Combine

extension Fistia {
    public func getRankingBattleResults(userId: String) -> AnyPublisher<Response.Result.Ranbato, AFError> {
        publish(Result.Ranbato.Find(userId: userId))
    }
}
