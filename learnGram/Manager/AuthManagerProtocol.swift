//
//  AuthManagerProtocol.swift
//  learnGram
//
//  Created by Yousuf on 19/5/23.
//

import Foundation

protocol AuthManagerProtocol {
    
    func getUserId(withEmail email:String, andPassword password:String) -> Int
}
