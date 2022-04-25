//
//  GroupListCell.swift
//  VK App
//
//  Created by Aleksander Pankow on 17/10/2020.
//

import UIKit
import Kingfisher

class GroupListCell: UITableViewCell {

    @IBOutlet weak var groupPhoto: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with group: GroupList) {
            let url = URL(string: "\(group.logo)")
            groupPhoto.kf.setImage(with: url)
            groupName.text = String("\(group.name)")
        }

}
