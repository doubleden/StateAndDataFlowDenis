//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct LoginView: View {
    @Bindable var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $loginViewVM.name)
                .multilineTextAlignment(.center)
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
        }
    }
    
    private func login() {
        if !loginViewVM.name.isEmpty {
            loginViewVM.isLoggedIn.toggle()
        }
    }
}

#Preview {
    LoginView(loginViewVM: LoginViewViewModel())
}
