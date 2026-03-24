//
//  LoginState.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 17/03/26.
//

struct LoginState {
    var email: String = ""
    var password: String = ""
    var isLoading: Bool = false
    var errorMessage: String?
    var isLoggedIn: Bool = false
    var isEmailValid: Bool = false
    var isPasswordValid: Bool = false
    
    var isFormValid : Bool {
        isEmailValid && isPasswordValid
    }
}
