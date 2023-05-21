//
//  LoginViewModel.swift
//  learnGram
//
//  Created by Yousuf on 19/5/23.
//

import Foundation


class LoginViewModel {
    
    private let authManager : AuthManagerProtocol
    private let userRepository : UserRepoProtocol
    
    init(authManager: AuthManagerProtocol, userRepository: UserRepoProtocol) {
        self.authManager = authManager
        self.userRepository = userRepository
    }
    
    func getUserId(withEmail email:String, andPassword password:String) -> Int {
        return authManager.getUserId(withEmail: email, andPassword: password)
    }
    
    func getUserWithId(userId : Int) -> User? {
        return userRepository.getUserById(userId: userId)
    }
    
    func onLoginSuccess(user : User) {
        userRepository.setUser(user: user)
    }
}
