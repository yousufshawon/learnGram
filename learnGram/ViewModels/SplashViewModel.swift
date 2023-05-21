//
//  SplashViewModel.swift
//  learnGram
//
//  Created by Yousuf on 1/5/23.
//

import Foundation

class SplashViewModel {
    
    private let splashRepository : SplashRepository
    private let userRepository : UserRepoProtocol
    
    
    init( with splashRepository : SplashRepository, and userRepository : UserRepoProtocol ) {
        self.splashRepository = splashRepository
        self.userRepository = userRepository
        
    }
    
    func getSplashText() -> String {
        return splashRepository.getSplashText()
    }
    
    func getCurrentUser() -> User? {
        return userRepository.getUser()
    }
 }
