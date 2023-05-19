//
//  UserDataSource.swift
//  learnGram
//
//  Created by Yousuf on 19/5/23.
//

import Foundation

class UserDataSource {
    
    static let totalUser = 5
    var users : [User] = []
    
    init() {
       buildUsers()
    }
    
    private func buildUsers() {
        let count = 1...UserDataSource.totalUser
        for id in count {
            let user = User(id: id, email: "user\(id)@demo.com", name: "User\(id)")
            users.append(user)
        }
        print("Users: \(users)")
    }
    
    func getUserById(id:Int) -> User? {
        if let user = users.first(where: {$0.getId() == id}) {
            return user
        }
        return nil
    }
}
