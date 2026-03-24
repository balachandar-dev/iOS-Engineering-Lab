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
    
    func send(intent: LoginIntent) {
        switch intent {
        case .loginTapped:
            login()
        case .emailChanegd(let emailString):
            state.email = emailString
        case .passwordChanged(let passwordString):
            state.password = passwordString
        }
    }
    
    func login() {
        state.isLoading = true
        Task {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            DispatchQueue.main.async {
                self.state.isLoading = false
                
                if self.state.email == "user@apple.com" && self.state.password == "pwd" {
                    self.state.isLoggedIn = true
                } else {
                    self.state.errorMessage = "Invalid Credentials"
                }
            }
        }
    }
}
