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

    @IBOutlet weak var WallTableView: UITableView!
    
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
        WallTableView.delegate = self
        WallTableView.dataSource = self

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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WallTextCell") as! ProfileNewsCell

        cell.NewsCellPhoto.image = (newsArray[indexPath.row][2] as! UIImage)
        cell.NewsCellText.textColor = .black
        cell.LikeCount.text = "\(newsArray[indexPath.row][4])"
        cell.RepostCount.text = "\(newsArray[indexPath.row][5])"
        cell.NewsCellText.text = (newsArray[indexPath.row][3] as! String)
        
        return cell
    }


}
