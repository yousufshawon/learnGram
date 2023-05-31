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
    
    private let viewModel = LoginViewModel(authManager: LocalAuthManager(), userRepository: UserLocalRepository())
    private let navigationManager = NavigationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginController viewDidLoad()")
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
        
        // remove this line. test code
        navigationManager.replaceWithAppBarController(currentViewController: self)
        
        if(!email!.isValidEmail) {
            errorLabel.text = "Invalid email"
            return
        }
        
        let userId = viewModel.getUserId(withEmail: email!, andPassword: password!)
        if (userId != -1) {
            
            let currentUser = viewModel.getUserWithId(userId: userId)
            if(currentUser != nil) {
                // after sccess
                print("Logged in user: \(String(describing: currentUser))")
                viewModel.onLoginSuccess(user: currentUser!)
                
                errorLabel.text  = ""
                
                // move to Home
                print("Moving to Home")
                navigationManager.replaceWithAppBarController(currentViewController: self)
                
            } else {
                errorLabel.text = "User not found"
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
