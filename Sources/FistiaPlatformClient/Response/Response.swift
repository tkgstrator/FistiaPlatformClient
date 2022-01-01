//
//  Response.swift
//  FistiaPlatformClient
//
//  Created by devonly on 2022/01/02.
//

import Foundation

public enum Response {
    public struct Empty: Codable {}
    
    public enum Auth {
        public struct Local: Codable {
            let authToken: String
        }
        
        public struct RequestResetPassword: Codable {
            let email: String
        }
        
        public struct ResetPassword: Codable {
            let verificationCode: String
            let newPassword: String
        }
    }
    
    public struct Users: Codable {
        public let users: [User]
        public let totalCount: Int
    }
    
    public struct User: Codable {
        public let serial: Int
        public let email: String
        public let isEmailRegistered: Bool
        public let id: String
        public let idSetCount: Int
        public let name: String
        public let avatarUri: String
        public let authority: String
        public let isProtected: Bool
        public let availableAuthProviderCount: Int
        public let depositAmount: Int
        public let followCount: Int
        public let followerCount: Int
        public let followsUri: String
        public let followersUri: String
        public let sentFollowRequestsUri: String
        public let receivedFollowRequestsUri: String
        public let sessionsUri: String
        public let damTomoAccountUri: String
        public let twitterAccountUri: String
        public let createdAt: String
        public let updatedAt: String
        public let deletedAt: String
    }
    
    public enum Result {
        public struct Ranbato: Codable {
            public let damRankingBattleResults: [Result]
            public let totalCount: Int
            
            public struct Result: Codable {
//                public let serial: Int
                public let content: Content
                public let totalPoints: String
                public let rank: Int
                public let participants: Int
                public let sungAt: String
                public let createdAt: String
                public let updatedAt: String
                public let singerUri: String
            }
            
            public struct Content: Codable {
                public let requestNumber: Int
                public let title: String
                public let artistName: String
                public let createdAt: String
                public let updatedAt: String
            }
        }
    }
    
    public enum Account {
        public struct Twitter: Codable {
            public let id: String
            public let screenName: String
            public let name: String
            public let ownerUri: String
            public let createdAt: String
            public let updatedAt: String
        }
        
        public struct Damtomo: Codable {
            public let number: Int
            public let cdmNumber: String
            public let ownerUri: String
            public let createdAt: String
            public let updatedAt: String
        }
    }
}
