//
//  SignupViewModel.swift
//  learnGram
//
//  Created by Yousuf on 20/5/23.
//

import Foundation

class SignupViewModel {
    
    private var userRepository : UserRepoProtocol
    private var authManager : AuthManagerProtocol
    
    init(userRepository: UserRepoProtocol, authManager : AuthManagerProtocol) {
        self.userRepository = userRepository
        self.authManager = authManager
    }
    
    func addNewUser(name: String, email : String, password:String) -> User! {
        
        let userCount = userRepository.getTotalUser()
        let newUserId = userCount + 1
        let newUser = User(id: newUserId, email: email, name: name)
        let authData = AuthData(id: newUserId, email: email, password: password)
        
        print("SignupViewModel: New user: \(newUser)")
        print("SignupViewModel: AuthData: \(authData)")
        
        authManager.addAuthData(authData: authData)
        let res =  userRepository.addUser(user: newUser)
        
        if (res) {
            return newUser
        }
        return nil
    }
    
    func onSignupSuccess(user:User) {
        userRepository.setUser(user: user)
    }
    
}
