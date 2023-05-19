//
//  User.swift
//  learnGram
//
//  Created by Yousuf on 19/5/23.
//

import Foundation

struct User {
    private let id : Int
    private let email : String
    private let name : String
    
    init(id:Int, email: String, name: String) {
        self.id = id
        self.email = email
        self.name = name
    }
    
    func getId() -> Int {
        return id
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    func getName() -> String {
        return self.name
    }
}
