//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var counter = 0
    @Published var isLoggedIn = false
    @Published var isNameValid = false
    
    func countLetters() {
        counter = name.count
        validateName()
    }
    
    private func validateName() {
        if name.count >= 3 {
            isNameValid = true
        } else {
            isNameValid = false
        }
    }
}
