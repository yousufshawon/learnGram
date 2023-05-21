//
//  NavigationManager.swift
//  learnGram
//
//  Created by Yousuf on 21/5/23.
//

import Foundation
import UIKit

class NavigationManager {
    
    func replaceWithAppBarController(currentViewController : UIViewController) {
        print("Replace with AppBarController")
        if let tabBarController = currentViewController.storyboard?.instantiateViewController(
            withIdentifier: Constants.ViewController.appTabBarControllerStodyboardId) as? UITabBarController {
            
            // This presents a NavigationViewController
            //self.present(loginNavigationController, animated: true)
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let sceneDelegate = windowScene.delegate as? SceneDelegate {
                    sceneDelegate.window?.rootViewController = tabBarController
                }
            }

        }
    }
    
    func replaceWithLoginNavigationController(currentViewController : UIViewController) {
        print("Replace with LoginNavigationViewController")
        if let loginNavigationController = currentViewController.storyboard?.instantiateViewController(
            withIdentifier: Constants.ViewController.loginNavigationControllerStoryboardId) as? UINavigationController {

            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let sceneDelegate = windowScene.delegate as? SceneDelegate {
                    sceneDelegate.window?.rootViewController = loginNavigationController
                }
            }

        }
    }
    
}
