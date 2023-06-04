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
    @IBOutlet private var collectionView : UICollectionView!
    
    private let navigationManager = NavigationManager()
    let viewModel = ProfiViewModel(userRepository: UserLocalRepository())
    var cellSize = 120.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageCellNib = UINib(nibName: ImageCell.identifierName, bundle: nil)
        collectionView.register(imageCellNib, forCellWithReuseIdentifier: ImageCell.identifierName)
        collectionView.setCollectionViewLayout(UICollectionViewFlowLayout.init(), animated: true)
        
        calculateCellSize()
        initView()
        
        // Do any additional setup after loading the view.
    }
    
    private func initView() {
        
        let borderColor = UIColor(hex: Constants.ColorHex.themeColor)
        
        profileImageView.makeCircleShape()
        profileImageView.makeBorder(borderWidth: 3.0, color: borderColor! )
        
        setUserProfile()
    }
    
    func calculateCellSize(){
        let items = viewModel.itemsInCollectiRow
        print("Items in row: \(items)")
        let spacingBetweenItem = 10
        let horizontalMargin = 10
        let totalSpacing = horizontalMargin +  (items - 1) * spacingBetweenItem + horizontalMargin
        print("Total spacing: \(totalSpacing)")
        
        let width = self.view.frame.width
        print("Width: \(width)")
        self.cellSize = (width - Double(totalSpacing)) / Double(items)
        print("Cell size: \(self.cellSize)")
        
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
