//
//  ProfileViewModel.swift
//  learnGram
//
//  Created by Yousuf on 22/5/23.
//

import Foundation

class ProfiViewModel {
    
    private let userRepository : UserRepoProtocol
    
    init(userRepository: UserRepoProtocol) {
        self.userRepository = userRepository
    }
    
    
    func onLogout() {
        userRepository.onLogout()
    }
    
    func getUser() -> User? {
        return userRepository.getUser()
    }
    
}
