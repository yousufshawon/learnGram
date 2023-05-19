//
//  AuthDataSource.swift
//  learnGram
//
//  Created by Yousuf on 18/5/23.
//

import Foundation

class AuthDataSource {
    
    private var credentials : [AuthData] = [];
    
    init() {
        let count = 1...5
        for id in count {
            let authData = AuthData(id: id, email: "user\(id)@demo.com", password: "pass\(id)")
            //print("id: \(id) \(authData)")
            credentials.append(authData)
        }
        
        print("Credentials: \(credentials)")
    }
    
    func getUserId(withEmail email:String, andPassword password:String) -> Int {
        
        if let res = credentials.first(where: { $0.email == email && $0.password == password } ) {
            print("Found auth data: \(res)")
            return res.id
        }
        
        return -1
    }
    
}
