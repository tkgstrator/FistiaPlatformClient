//
//  Keychain.swift
//  FistiaPlatformClient
//
//  Created by devonly on 2022/01/02.
//

import Foundation
import KeychainAccess

extension Keychain {
    internal enum KeychainKeys: String, CaseIterable {
        case bearerToken    = "FISTIA.BEARERTOKEN"
    }
    
    internal func getValue() -> String? {
        try? getString(KeychainKeys.bearerToken.rawValue)
    }
    
    internal func setValue(_ bearerToken: String) {
        try? set(bearerToken, key: KeychainKeys.bearerToken.rawValue)
    }
}
