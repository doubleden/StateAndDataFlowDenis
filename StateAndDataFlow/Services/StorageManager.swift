//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Denis Denisov on 23/4/24.
//

import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func create(_ user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func read() -> User {
        guard let userData else { return User() }
        let user = try? JSONDecoder().decode(User.self, from: userData)
        return user ?? User()
    }
    
    func delete() {
        userData = nil
    }
}
