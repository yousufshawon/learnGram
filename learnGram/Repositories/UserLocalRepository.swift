//
//  UserLocalRepository.swift
//  learnGram
//
//  Created by Yousuf on 21/5/23.
//

import Foundation


class UserLocalRepository : UserRepoProtocol {


    func getTotalUser() -> Int {
        return UserDataSource.shared.getUserCount()
    }
    
    func getUserById(userId: Int) -> User? {
        return UserDataSource.shared.getUserById(id: userId)
    }
    
    func addUser(user: User) -> Bool{
        return UserDataSource.shared.addUser(user: user)
    }
    
    func getUser() -> User? {
        return UserDataSource.shared.getCurrentUser()
    }
    
    func setUser(user: User) {
        UserDataSource.shared.setCurrentUser(user: user)
    }
    
    func onLogout() {
        UserDataSource.shared.onLogout()
    }

    
}
