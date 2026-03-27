//
//  LoginRouter.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 24/03/26.
//

struct LoginReducer {
    static func reduce(state: LoginState, intent: LoginIntent) -> LoginState {
        var newState = state
        switch intent {
        case .emailChanegd(let email):
            newState.email = email
        case .passwordChanged(let password):
            newState.password = password
        case .loginTapped:
            let isEmailValid = LoginValidators.isEmailValid(emailString: state.email)
            let isPasswordValid = LoginValidators.isPasswordValid(password: state.password)
            if !isEmailValid {
                newState.errorMessage = "Invalid Email"
                newState.isEmailValid = false
            } else if !isPasswordValid {
                newState.errorMessage = "Invalid Password"
                newState.isEmailValid = false
            } else {
                newState.errorMessage = nil
                newState.isEmailValid = true
                newState.isPasswordValid = true
            }
            newState.isLoading = false
        }
        return newState
    }
}
