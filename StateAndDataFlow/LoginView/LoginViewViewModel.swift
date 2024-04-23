//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Observation

@Observable
final class LoginViewViewModel {
    var name = ""
    var isLoggedIn = false
}
