//
//  PostDetailsViewController.swift
//  learnGram
//
//  Created by Yousuf on 4/6/23.
//

import UIKit

class PostDetailsViewController: UIViewController {
    
    static let storyBoardId = "PostDetailsViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        updateTitle(title: "Details")
        
        // Do any additional setup after loading the view.
    }
    
    func updateTitle(title : String) {
        self.title = title
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
