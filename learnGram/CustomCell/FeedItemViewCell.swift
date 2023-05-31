//
//  FeedItemViewCell.swift
//  learnGram
//
//  Created by Yousuf on 26/5/23.
//

import UIKit

class FeedItemViewCell: UITableViewCell {
    
    static let identifierId : String = "FeedItemViewCell"
    @IBOutlet var descriptionLabel : UILabel!
    @IBOutlet var nameLabel : UILabel!
    @IBOutlet var profilePic : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindView(index:Int) {
        var fixedText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
        var dText = "\(index) \(fixedText)"
        
        if(index % 3 == 0) {
            dText += " \(fixedText) \(fixedText)"
        }
        
        if(index % 5 == 0) {
            dText = "\(index) Lorem Ipsum is simply dummy text "
        }
        descriptionLabel.text = dText
        nameLabel.text = "User\(index)"
        profilePic.makeCircleShape()
    }
    
}
