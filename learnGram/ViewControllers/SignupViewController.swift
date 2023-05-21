//
//  SignupViewController.swift
//  learnGram
//
//  Created by Yousuf on 16/5/23.
//

import UIKit

class SignupViewController: UIViewController {
    
    static let storyboardId = "SignupViewController"
    
    @IBOutlet private var textFieldName : UITextField!
    @IBOutlet private var textFieldEmail : UITextField!
    @IBOutlet private var textFieldPassword : UITextField!
    @IBOutlet private var textFieldRePassword : UITextField!
    @IBOutlet private var switchYearRestriction : UISwitch!
    @IBOutlet private var labelError : UILabel!
    
    private let navigationManager = NavigationManager()
    private let viewModel = SignupViewModel(userRepository: UserLocalRepository(), authManager: LocalAuthManager())

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SignupViewController: viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUpAction() {
        
        let name = textFieldName.text
        let email = textFieldEmail.text
        let password = textFieldPassword.text
        let rePassword = textFieldRePassword.text
        let ageStatus = switchYearRestriction.isOn
        
        print("Name: \(name) Email: \(email) Password: \(password) RePassword: \(rePassword) Age Status: \(ageStatus)")
        
        doSignUp(name: name!, email: email!, password: password!, rePassword: rePassword!, ageStatus: ageStatus)
        
    }
    
    private func doSignUp(name:String, email:String, password:String, rePassword : String, ageStatus : Bool) {
        
        var errorMessage = ""
        
        if( name.isEmpty ) {
            errorMessage = "Enter Name"
        } else if( errorMessage.isEmpty && email.isEmpty ) {
            errorMessage = "Enter email"
        } else if( errorMessage.isEmpty && password.isEmpty ) {
            errorMessage = "Enter password"
        } else if( errorMessage.isEmpty && rePassword.isEmpty ) {
            errorMessage = "Re enter password"
        }
        
        if(!errorMessage.isEmpty) {
            setErrorMessage(message: errorMessage)
            return
        }
        
        if ( errorMessage.isEmpty && !email.isValidEmail) {
            errorMessage = "Invalid email"
        } else if( errorMessage.isEmpty && password != rePassword) {
            errorMessage = "Password mismatch"
        } else if(errorMessage.isEmpty && !ageStatus) {
            errorMessage = "Please make sure you are atleaset 18"
        }
        
        if(!errorMessage.isEmpty) {
            setErrorMessage(message: errorMessage)
            return
        }
        
        let user = viewModel.addNewUser(name: name, email: email, password: password)
        
        if(user != nil) {
            viewModel.onSignupSuccess(user: user!)
            moveToHome()
        }else {
            labelError.text = "Can't add user"
        }
        
    }
    
    private func setErrorMessage(message : String) {
        labelError.text = message
    }
    
    private func moveToHome() {
        navigationManager.replaceWithAppBarController(currentViewController: self)
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
