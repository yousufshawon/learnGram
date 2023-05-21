//
//  SplashViewController.swift
//  learnGram
//
//  Created by Yousuf on 1/5/23.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet var textLabel : UILabel!
    
    private let viewModel = SplashViewModel(with: SplashRepositoryImpl(), and: UserLocalRepository())
    private let navigationManager = NavigationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SplashViewController: viewDidLoad")
        self.textLabel.text = viewModel.getSplashText()
        
        // This works with selector
        //Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerFireMethod), userInfo: nil, repeats: false)
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false ) { timer in
            self.loadNextScreen()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SplashViewController: viewWillAppear")
    }
    
    
    @objc func timerFireMethod() {
        print("timerFireMethod")
        loadNextScreen()
       
    }
    
    func loadNextScreen() {
        print("SplashViewController: Load Next Screen")
        
        // This presents a ViewController
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: LoginController.storyboardId) as! LoginController
//        self.present(newViewController, animated: true, completion: nil)
        
        let currentUser = viewModel.getCurrentUser()
        
        if(currentUser != nil) {
            print("SplashViewController: User logged in: \(currentUser!)")
            print("SplashViewController: Load Home")
            navigationManager.replaceWithAppBarController(currentViewController: self)
        }else {
            print("SplashViewController: User not logged in. Load Login screen")
            navigationManager.replaceWithLoginNavigationController(currentViewController: self)
        }
        
//        if let loginNavigationController = self.storyboard?.instantiateViewController(
//            withIdentifier: Constants.ViewController.loginNavigationControllerStoryboardId) as? UINavigationController {
//
//            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
//                if let sceneDelegate = windowScene.delegate as? SceneDelegate {
//                    sceneDelegate.window?.rootViewController = loginNavigationController
//                }
//            }
//
//        }
        
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
