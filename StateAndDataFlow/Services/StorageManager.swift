//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Denis Denisov on 23/4/24.
//

import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    func create(_ user: User) {
        UserDefaults.standard.set(user.username, forKey:"username")
        UserDefaults.standard.set(user.isLoggedIn, forKey:"isLoggedIn")
    }
    
    func read() -> User {
        let username = UserDefaults.standard.string(forKey: "username") ?? ""
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        return User(username: username, isLoggedIn: isLoggedIn)
    }
    
    func delete() {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "isLoggedIn")
    }
}
