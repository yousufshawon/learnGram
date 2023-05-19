//
//  LoginController.swift
//  learnGram
//
//  Created by Yousuf on 10/5/23.
//

import UIKit

class LoginController: UIViewController {
    
    static let storyboardId = "LoginController"
    
    @IBOutlet var errorLabel : UILabel!
    @IBOutlet var emailTextField : UITextField!
    @IBOutlet var passwordTextField : UITextField!
    
    private let viewModel = LoginViewModel(authManager: LocalAuthManager(authDataSource: AuthDataSource()))

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }
    
    private func initView() {
        errorLabel.text = ""
    }
    
    
    @IBAction func onLogin() {
        
        print("onLogin")
        
        // do validation
        
        let email = emailTextField.text
        let password = passwordTextField.text
        
        print("Email: \(email) Password: \(password)")
        
        let userId = viewModel.getUserId(withEmail: email!, andPassword: password!)
        
        if (userId != -1) {
            errorLabel.text  = ""
            // after sccess
            // move to Home
            print("Moving to Home")
            if let tabBarController = self.storyboard?.instantiateViewController(
                withIdentifier: Constants.ViewController.appTabBarControllerStodyboardId) as? UITabBarController {
                
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    if let sceneDelegate = windowScene.delegate as? SceneDelegate {
                        sceneDelegate.window?.rootViewController = tabBarController
                    }
                }

            }
            
        } else {
            errorLabel.text = "Invalid Credential!"
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
