//
//  SplashRepositoryImpl.swift
//  learnGram
//
//  Created by Yousuf on 1/5/23.
//

import Foundation

class SplashRepositoryImpl : SplashRepository{
    
    private let dataSource : SplashDataSource
    
    init() {
        dataSource = SplashDataSource()
    }
    
    func getSplashText() -> String {
        return dataSource.getSplashText()
    }
    
}
