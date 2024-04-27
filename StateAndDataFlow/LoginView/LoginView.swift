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
                TextField("Enter your name...", text: $loginViewVM.user.name)
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled()
                    
                Text(loginViewVM.nameLettersCount)
                    .foregroundStyle(loginViewVM.isNameValid ? .green : .red)
            }
            
            Button(action: loginViewVM.login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(!loginViewVM.isNameValid)
        }
        .padding()
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
