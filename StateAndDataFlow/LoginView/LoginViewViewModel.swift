//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    @Published var user: User
    
    var isNameValide: Bool {
        user.name.count >= 3
    }
    
    var nameLettersCount: String {
        user.name.count.formatted()
    }
    
    private let storageManager = StorageManager.shared
    
    init(user: User) {
        self.user = user
    }
    
    func login() {
        user.isLoggedIn.toggle()
        storageManager.create(user)
    }
    
    func logout() {
        user.name = ""
        user.isLoggedIn.toggle()
        storageManager.delete()
    }
}
