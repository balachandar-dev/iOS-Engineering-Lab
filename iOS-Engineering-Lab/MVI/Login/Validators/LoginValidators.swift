//
//  LoginValidators.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 24/03/26.
//

import Foundation

struct LoginValidators {
    
    static func isEmailValid(emailString: String) -> Bool {
        let regex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: emailString)
    }
    
    static func isPasswordValid(password: String) -> Bool {
        return password.count >= 5
    }
}
