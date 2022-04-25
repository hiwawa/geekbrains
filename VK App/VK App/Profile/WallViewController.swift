//
//  WallViewController.swift
//  VK App
//
//  Created by Aleksander Pankow on 28/05/2021.
//

import UIKit
import RealmSwift
import SwiftyJSON
import Kingfisher

class WallViewController: UIViewController {

    
    @IBOutlet weak var NewsTableView: UITableView!
    
    //@IBOutlet weak var WallTableView: UITableView!
    
    var newsArray = [
        [1, "title", UIImage(named: "news1.jpeg")!, "description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1", 0, 0],
        [2, "title", UIImage(named:  "news2.jpeg")!, "description 2", 0, 0],
        [3, "title", UIImage(named: "news3.jpeg")!, "description 3", 0, 0],
        [4, "title", UIImage(named:  "news4.jpeg")!, "description 4", 0, 0],
        [5, "title", UIImage(named: "news5.jpeg")!, "description 5", 0, 0],
        [6, "title", UIImage(named:  "news6.jpeg")!, "description 6", 0, 0]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsTableView.delegate = self
        NewsTableView.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    

}

extension WallViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellPhoto = tableView.dequeueReusableCell(withIdentifier: "imageCell") as! NewsListCell
//        let cellText = tableView.dequeueReusableCell(withIdentifier: "textCell") as! NewsListCell
//        let cellAuthor = tableView.dequeueReusableCell(withIdentifier: "authorCell") as! NewsListCell
//        let cellLike = tableView.dequeueReusableCell(withIdentifier: "likeCell") as! NewsListCell

        cellPhoto.PhotoNews.image = (newsArray[indexPath.row][2] as! UIImage)
//        cellText.TextNews.textColor = .black
//        cellText.TextNews.text = (newsArray[indexPath.row][3] as! String)
//        cellAuthor.AuthorName.text = "Aleksander"
//        cellAuthor.AuthorPhoto.image = (newsArray[indexPath.row][2] as! UIImage)
//        cellAuthor.DateNews.text = "18.04.1992 в 18:00"
//        cellLike.LikeCount.text = "\(newsArray[indexPath.row][4])"
//        cellLike.CommentCount.text = "\(newsArray[indexPath.row][5])"
        
        
        return cellPhoto
//        return cellText
//        return cellAuthor
//        return cellLike
    }


}
