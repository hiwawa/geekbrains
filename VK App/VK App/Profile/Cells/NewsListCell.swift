//
//  NewsListCell.swift
//  VK App
//
//  Created by Aleksander Pankow on 05/08/2021.
//

import UIKit

class NewsListCell: UITableViewCell {

    @IBOutlet weak var PhotoNews: UIImageView!
    @IBOutlet weak var TextNews: UITextView!
    @IBOutlet weak var AuthorPhoto: UIImageView!
    @IBOutlet weak var AuthorName: UILabel!
    @IBOutlet weak var DateNews: UILabel!
    @IBAction func LikeButton(_ sender: Any) {
    }
    @IBOutlet weak var LikeCount: UILabel!
    @IBAction func CommentButton(_ sender: Any) {
    }
    @IBOutlet weak var CommentCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
