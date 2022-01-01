//
//  File.swift
//  
//
//  Created by devonly on 2022/01/02.
//

import Foundation
import BetterSafariView
import SwiftUI

public struct Authorize: ViewModifier {
    @Binding var isPresented: Bool
    let service: Fistia
    
    public init(isPresented: Binding<Bool>, service: Fistia) {
        self._isPresented = isPresented
        self.service = service
    }
    
    public func body(content: Content) -> some View {
        content
            .webAuthenticationSession(isPresented: $isPresented, content: {
                WebAuthenticationSession(url: service.oauthURL, callbackURLScheme: "", completionHandler: { callbackURL, error in
                    print(callbackURL, error)
                })
            })
    }
}


extension View {
    public func authorize(isPresented: Binding<Bool>, service: Fistia) -> some View {
        self.modifier(Authorize(isPresented: isPresented, service: service))
    }
}
