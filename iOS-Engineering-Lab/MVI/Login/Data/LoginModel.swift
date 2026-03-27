//
//  LoginModel.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 25/03/26.
//

struct LoginRequestModel: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String
}
