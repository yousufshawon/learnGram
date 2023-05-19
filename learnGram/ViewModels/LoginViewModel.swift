//
//  LoginViewModel.swift
//  learnGram
//
//  Created by Yousuf on 19/5/23.
//

import Foundation


class LoginViewModel {
    
    private let authManager : AuthManagerProtocol
    
    init(authManager: AuthManagerProtocol) {
        self.authManager = authManager
    }
    
    func getUserId(withEmail email:String, andPassword password:String) -> Int {
        return authManager.getUserId(withEmail: email, andPassword: password)
    }
}
