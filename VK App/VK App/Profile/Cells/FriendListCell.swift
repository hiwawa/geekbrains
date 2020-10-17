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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
