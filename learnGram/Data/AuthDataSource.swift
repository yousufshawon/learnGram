//
//  AuthDataSource.swift
//  learnGram
//
//  Created by Yousuf on 18/5/23.
//

import Foundation

class AuthDataSource {
    
    static let shared  = AuthDataSource()
    
    private var credentials : [AuthData] = [];
    
    
    private init() {
        buildInitialCredeintials()
    }
    
    private func buildInitialCredeintials() {
        if(!credentials.isEmpty) {
            return
        }
        
        let count = 1...5
        for id in count {
            let authData = AuthData(id: id, email: "user\(id)@demo.com", password: "pass\(id)")
            credentials.append(authData)
        }
        
        print("AuthDataSource: Credentials: \(credentials)")
    }
    
    func getUserId(withEmail email:String, andPassword password:String) -> Int {
        
        if let res = credentials.first(where: { $0.email == email && $0.password == password } ) {
            print("Found auth data: \(res)")
            return res.id
        }
        
        return -1
    }
    
    func addAuthData(authData:AuthData) {
        credentials.append(authData)
        print("AuthDataSource: Total auth Data: \(credentials.count)")
    }
    
}
