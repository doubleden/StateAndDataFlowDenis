//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @State private var contentViewVM = ContentViewViewModel()
    @State private var loginViewVM = LoginViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environment(contentViewVM)
        .environment(loginViewVM)
    }
}
