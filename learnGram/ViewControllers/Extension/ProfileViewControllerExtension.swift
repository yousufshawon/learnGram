//
//  ProfileViewControllerExtension.swift
//  learnGram
//
//  Created by Yousuf on 4/6/23.
//

import Foundation
import UIKit


extension ProfileViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.imageCollectionItem
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        // This is not working as forceing me to use dequeueReusableCell
        //let cell = Bundle.main.loadNibNamed(ImageCell.identifierName, owner: self)?.first as! ImageCell
        //return cell
     
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifierName, for: indexPath) as! ImageCell
        return cell
    }
    
    
}



extension ProfileViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clciked at \(indexPath.item)")
        NavigationManager.pushViewControllerToNavigationController(from: self, with: PostDetailsViewController.storyBoardId)
    }
}


extension ProfileViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 10.0, bottom: 10.0, right: 10.0)
    }

}
