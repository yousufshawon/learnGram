//
//  ProfileViewController.swift
//  learnGram
//
//  Created by Yousuf on 17/5/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    static let storyboardId = "ProfileViewController"
    
    @IBOutlet private var profileImageView : UIImageView!
    @IBOutlet private var buttonLogout : UIButton!
    @IBOutlet private var labelName : UILabel!
    
    private let navigationManager = NavigationManager()
    private let viewModel = ProfiViewModel(userRepository: UserLocalRepository())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        // Do any additional setup after loading the view.
    }
    
    private func initView() {
        
        let borderColor = UIColor(hex: Constants.ColorHex.themeColor)
        
        profileImageView.makeCircleShape()
        profileImageView.makeBorder(borderWidth: 3.0, color: borderColor! )
        
        setUserProfile()
    }
    
    @IBAction private func onLogoutAction() {
        viewModel.onLogout()
        navigationManager.replaceWithLoginNavigationController(currentViewController: self)
    }
    
    private func setUserProfile() {
        let user = viewModel.getUser()
        
        if(user != nil) {
            labelName.text = user?.getName()
        } else {
            labelName.text = "....."
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
