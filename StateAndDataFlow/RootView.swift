//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct RootView: View {
    @Environment(LoginViewViewModel.self) private var loginViewVM
    
    var body: some View {
        if loginViewVM.isLoggedIn {
            ContentView()
        } else {
            LoginView(loginViewVM: loginViewVM)
        }
    }
}

#Preview {
    RootView()
        .environment(LoginViewViewModel())
}
