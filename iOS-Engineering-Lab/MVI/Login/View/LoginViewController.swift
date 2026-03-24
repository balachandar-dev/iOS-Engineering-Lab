//
//  SwiftUIView.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 17/03/26.
//

import SwiftUI
import Combine
import Foundation

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
        
    var body: some View {
        VStack(spacing: 16) {
            TextField("Email", text: Binding(get: {viewModel.state.email}, set: {viewModel.send(intent: .emailChanegd($0)) }
                ))
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: Binding(get: {viewModel.state.password}, set: {viewModel.send(intent: .passwordChanged($0)) }
                ))
            .textFieldStyle(.roundedBorder)
            if viewModel.state.isLoading {
                ProgressView()
            }
            Button("Login") {
                viewModel.send(intent: .loginTapped)
            }
            if let error = viewModel.state.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .navigationTitle("Login")
    }
}

#Preview {
    LoginView()
}
