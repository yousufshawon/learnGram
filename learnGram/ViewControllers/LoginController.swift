//
//  LoginController.swift
//  learnGram
//
//  Created by Yousuf on 10/5/23.
//

import UIKit

class LoginController: UIViewController {
    
    static let storyboardId = "LoginController"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLogin() {
        // do validation
        // after sccess
        print("onLogin")
       
        
        if let tabBarController = self.storyboard?.instantiateViewController(
            withIdentifier: Constants.ViewController.appTabBarControllerStodyboardId) as? UITabBarController {
           
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let sceneDelegate = windowScene.delegate as? SceneDelegate {
                    sceneDelegate.window?.rootViewController = tabBarController
                }
            }

        }
        
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
