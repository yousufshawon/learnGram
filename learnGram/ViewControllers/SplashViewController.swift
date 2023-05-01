//
//  SplashViewController.swift
//  learnGram
//
//  Created by Yousuf on 1/5/23.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet var textLabel : UILabel!
    
    private let viewModel = SplashViewModel(with: SplashRepositoryImpl())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SplashViewController: viewDidLoad")
        // Do any additional setup after loading the view.
        self.textLabel.text = viewModel.getSplashText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SplashViewController: viewWillAppear")
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
