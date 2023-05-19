//
//  AuthData.swift
//  learnGram
//
//  Created by Yousuf on 18/5/23.
//

import Foundation

struct AuthData {
     let id : Int
     let email : String
     let password : String
    
    init(id: Int, email: String, password: String) {
        self.id = id
        self.email = email
        self.password = password
    }
}
