//
//  AuthManager.swift
//  learnGram
//
//  Created by Yousuf on 19/5/23.
//

import Foundation

class LocalAuthManager : AuthManagerProtocol {
    
    
    func addAuthData(authData: AuthData) {
        AuthDataSource.shared.addAuthData(authData: authData)
    }
    
    func getUserId(withEmail email: String, andPassword password: String) -> Int {
        return AuthDataSource.shared.getUserId(withEmail: email, andPassword: password)
    }
    
    
}
