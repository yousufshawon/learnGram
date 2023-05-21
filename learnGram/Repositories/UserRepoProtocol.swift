//
//  UserRepoProtocol.swift
//  learnGram
//
//  Created by Yousuf on 18/5/23.
//

import Foundation

protocol UserRepoProtocol {
    
    func getTotalUser() -> Int
    func addUser(user : User) -> Bool
    func getUser() -> User?
    func setUser(user:User)
    func getUserById(userId : Int) -> User?
    func onLogout()
}
