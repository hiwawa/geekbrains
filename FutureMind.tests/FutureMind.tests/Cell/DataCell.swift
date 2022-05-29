//
//  DataCell.swift
//  FutureMind.tests
//
//  Created by Aleksander Pankow on 27/05/2022.
//

import UIKit
import Kingfisher

class DataListCell: UITableViewCell {
    
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var titleItem: UILabel!
    @IBOutlet weak var dateItem: UILabel!
    @IBOutlet weak var detailItem: UILabel!
    var urlItem = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(with data: DataModel) {
        
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd"
        let date = inputDateFormatter.date(from: data.modificationDate)
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd MMM yyyy"
        urlItem = data.url
        
        let url = URL(string: "\(data.image)")
        imageItem.kf.setImage(with: url)
        titleItem.text = String("\(data.title)")
        dateItem.text = String("\(outputDateFormatter.string(from: date!))")
        detailItem.text = String("\(data.details)")
    }
    
}
