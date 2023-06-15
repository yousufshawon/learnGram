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
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
