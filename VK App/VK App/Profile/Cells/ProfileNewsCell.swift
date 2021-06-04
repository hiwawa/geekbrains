//
//  ProfileNewsCell.swift
//  VK App
//
//  Created by Aleksander Pankow on 01/11/2020.
//
import UIKit

class ProfileNewsCell: UITableViewCell {

    @IBOutlet weak var NewsCellText: UITextView!
    @IBOutlet weak var LikeCount: UILabel!
    @IBOutlet weak var RepostButton: UIButton!
    @IBOutlet weak var RepostCount: UILabel!
    @IBOutlet weak var NewsCellPhoto: UIImageView!
    //@IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBAction func LikeButton(_ sender: UIButton) {
        
        
    }
    @IBOutlet weak var NewsViewContainer: UIView!
    @IBOutlet weak var NewsCellShadow: UIView!
    
//    internal var aspectConstraint : NSLayoutConstraint? {
//            didSet {
//                if oldValue != nil {
//                    NewsCellPhoto.removeConstraint(oldValue!)
//                }
//                if aspectConstraint != nil {
//                    NewsCellPhoto.addConstraint(aspectConstraint!)
//                }
//            }
//        }
//
//        override func prepareForReuse() {
//            super.prepareForReuse()
//            aspectConstraint = nil
//        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NewsViewContainer.layer.cornerRadius = 12
        NewsCellShadow.layer.shadowColor = UIColor(red: 0.15, green: 0.53, blue: 0.96, alpha: 1.00).cgColor
        NewsCellShadow.layer.shadowOpacity = 0.5
        NewsCellShadow.layer.shadowRadius = 8
        NewsCellShadow.layer.shadowOffset = CGSize(width: 0, height: 1)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
