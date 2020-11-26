//
//  ProfileViewController.swift
//  VK App
//
//  Created by Aleksander Pankow on 28/09/2020.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var user = UserModel(username: "outplay", password: "test", firstname: "Aleksander", lastname: "Pankow", phone: "884730857", dateofbirth: "18.04.1992", email: "aleksander.pankow@icloud.com")
    
    var activity = [
        [1, "like"],
        [3, "repost"]
    ]
    
    var newsArray = [
        [1, "title", UIImage(named: "news1.jpeg")!, "description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1description 1", 0, 0],
        [2, "title", UIImage(named:  "news2.jpeg")!, "description 2", 0, 0],
        [3, "title", UIImage(named: "news3.jpeg")!, "description 3", 0, 0],
        [4, "title", UIImage(named:  "news4.jpeg")!, "description 4", 0, 0],
        [5, "title", UIImage(named: "news5.jpeg")!, "description 5", 0, 0],
        [6, "title", UIImage(named:  "news6.jpeg")!, "description 6", 0, 0]
    ]
    
    
    @IBOutlet weak var ProfileNewsList: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var friendsCount: UILabel!
    @IBOutlet weak var groupCount: UILabel!
    
    var count = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
           //let session = Session.instance
            nameLabel.text = "\(user.firstname) \(user.lastname)"
            usernameLabel.text = "@\(user.username)"
            ProfileNewsList.delegate = self
            ProfileNewsList.dataSource = self
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! ProfileNewsCell
        //cell.newsAutor.text = "\(user.firstname) \(user.lastname)"
        //cell.layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        cell.NewsCellPhoto.image = (newsArray[indexPath.row][2] as! UIImage)
        cell.NewsCellText.textColor = .black
        cell.LikeCount.text = "\(newsArray[indexPath.row][4])"
        cell.RepostCount.text = "\(newsArray[indexPath.row][5])"
        cell.NewsCellText.text = (newsArray[indexPath.row][3] as! String)
        return cell
    }


}
