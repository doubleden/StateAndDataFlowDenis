//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                TextField("Enter your name...", text: $loginViewVM.name)
                    .multilineTextAlignment(.center)
                    .onChange(of: loginViewVM.name) { _, _ in
                        loginViewVM.countLetters()
                    }
                    .autocorrectionDisabled()
                    
                Text(loginViewVM.counter.formatted())
                    .foregroundStyle(loginViewVM.isNameValid ? .green : .red)
            }
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(loginViewVM.isNameValid ? false : true)
        }
        .padding()
    }
    
    private func login() {
        if !loginViewVM.name.isEmpty {
            loginViewVM.isLoggedIn.toggle()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
