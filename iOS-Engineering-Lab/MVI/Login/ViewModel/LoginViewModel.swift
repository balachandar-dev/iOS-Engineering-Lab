//
//  LoginViewModel.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 17/03/26.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    @Published private(set) var state = LoginState()
    
    var onStateChanged: ((LoginState) -> Void)?
    private let loginSevice = LoginService()
    
    func send(intent: LoginIntent) {
        state = LoginReducer.reduce(state: state, intent: intent)
        if case .loginTapped = intent {
            if state.isFormValid {
                login()
            }
        }
    }
    
    func login() {
        state.isLoading = true
        Task {
                self.state.isLoading = false
                do {
                    let loginResponse = try await loginSevice.callLoginApi(requestData: LoginRequestModel(email: self.state.email, password: self.state.password))
                    
                } catch {
                    state.errorMessage = error.localizedDescription
                }
                state.isLoading = false
                state.isLoggedIn = false
        }
    }
}
