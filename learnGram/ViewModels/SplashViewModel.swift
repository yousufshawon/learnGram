//
//  SplashViewModel.swift
//  learnGram
//
//  Created by Yousuf on 1/5/23.
//

import Foundation

class SplashViewModel {
    
    private let splashRepository : SplashRepository
    
    init( with splashRepository : SplashRepository ) {
        self.splashRepository = splashRepository
    }
    
    func getSplashText() -> String {
        return splashRepository.getSplashText()
    }
}
