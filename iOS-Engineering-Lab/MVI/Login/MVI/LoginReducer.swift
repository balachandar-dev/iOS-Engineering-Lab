//
//  LoginRouter.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 24/03/26.
//

struct LoginReducer {
    static func reduce(state: LoginState, intent: LoginIntent) -> LoginState {
        var newState = LoginState()
        switch intent {
        case .emailChanegd(let email):
            newState.email = email
        case .passwordChanged(let password):
            newState.password = password
        case .loginTapped:
        }
        return newState
    }
}
