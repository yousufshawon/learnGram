//
//  AuthManager.swift
//  learnGram
//
//  Created by Yousuf on 19/5/23.
//

import Foundation

class LocalAuthManager : AuthManagerProtocol {

    private let authDataSource : AuthDataSource
    
    init(authDataSource: AuthDataSource) {
        self.authDataSource = authDataSource
    }
    
    func getUserId(withEmail email: String, andPassword password: String) -> Int {
        return authDataSource.getUserId(withEmail: email, andPassword: password)
    }
    
    
}
