//
//  UserDataSource.swift
//  learnGram
//
//  Created by Yousuf on 19/5/23.
//

import Foundation

class UserDataSource {
    
    static let shared = UserDataSource()
    let initialTotalUser = 5
    var users : [User] = []
    private var currentUser : User? = nil
    

    private init() {
        buildUsers()
    }
    
    private func buildUsers() {
        if(!users.isEmpty) {
            print("UserDataSource: Default Users is already created")
            return
        }
        let count = 1...initialTotalUser
        for id in count {
            let user = User(id: id, email: "user\(id)@demo.com", name: "User\(id)")
            users.append(user)
        }
        print("UserDataSource: Users: \(users)")
    }
    
    func getUserById(id:Int) -> User? {
        if let user = users.first(where: {$0.getId() == id}) {
            return user
        }
        return nil
    }
    
    func getUserCount() -> Int {
        return users.count
    }
    
    func addUser(user : User) -> Bool {
        users.append(user)
        print("UserDataSource: Total user: \(users.count)")
        return true
    }
    
    func setCurrentUser(user : User) {
        print("UserDataSource: Setting current user")
        currentUser = user
    }
    
    func onLogout() {
        print("UserDataSource: User logout. setting current user  nil")
        currentUser = nil
    }
    
    func isUserLoggedIn() -> Bool {
        return currentUser != nil
    }
    
    func getCurrentUser() -> User? {
        return currentUser
    }
}
