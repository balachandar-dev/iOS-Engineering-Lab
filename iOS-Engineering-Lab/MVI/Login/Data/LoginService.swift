//
//  LoginService.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 17/03/26.
//

import Foundation

struct LoginService {
    func callLoginApi(requestData: LoginRequestModel) async throws -> LoginResponse? {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(requestData)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let(data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        if httpResponse.statusCode == 200 {
            let decoded = try JSONDecoder().decode(LoginResponse.self, from: data)
            return decoded
        } else {
               throw URLError(.badServerResponse)
        }
    }
}
