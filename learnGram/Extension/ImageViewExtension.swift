//
//  ImageViewExtension.swift
//  learnGram
//
//  Created by Yousuf on 17/5/23.
//

import Foundation
import UIKit


extension UIImageView {
    
    func makeCircleShape(){
        self.layer.cornerRadius = self.layer.frame.width / 2.0
    }
    
    func makeBorder(borderWidth: CGFloat, color : UIColor) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
    }
    
}
