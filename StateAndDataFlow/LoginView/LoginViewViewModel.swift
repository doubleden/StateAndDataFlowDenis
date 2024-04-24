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
    
    private let storageManager = StorageManager.shared
    
    func fetchUser() {
        let user = storageManager.read()
        name = user.username
        isLoggedIn = user.isLoggedIn
    }
    
    func login() {
        isLoggedIn = true
        storageManager.create(User(username: name, isLoggedIn: true))
    }
    
    func logout() {
        isLoggedIn = false
        name = ""
        counter = 0
        isNameValid = false
        storageManager.delete()
    }
    
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
