//
//  FriendListCell.swift
//  VK App
//
//  Created by Aleksander Pankow on 13/10/2020.
//

import UIKit

class FriendListCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var photoShadow: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        friendName.textColor = .black
        
        userPhoto.layer.cornerRadius = 30
        //userPhoto.layer.backgroundColor = UIColor.white.cgColor
        photoShadow.layer.cornerRadius = 30
        photoShadow.layer.shadowColor = UIColor.black.cgColor
        photoShadow.layer.shadowOpacity = 0.8
        photoShadow.layer.shadowRadius = 5
        photoShadow.layer.shadowOffset = CGSize(width: 0, height: 0)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
