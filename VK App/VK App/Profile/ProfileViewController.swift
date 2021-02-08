//
//  ProfileViewController.swift
//  VK App
//
//  Created by Aleksander Pankow on 28/09/2020.
//

import UIKit
import RealmSwift
import SwiftyJSON
import Kingfisher

class ProfileViewController: UIViewController {
    
    private lazy var user = try? Realm().objects(UserModel.self)
    
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
    @IBOutlet weak var userPhoto: UIImageView!
    
    var count = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
           //let session = Session.instance
            
            ApiRequest.loadUser(token: NetworkSession.shared.token) { [weak self]
                user in try? RealmService.save(items: user)
                self?.nameLabel.text = "\(user[0].firstname) \(user[0].lastname)"
                self?.usernameLabel.text = "@\(user[0].nickname)"
                self?.userPhoto.kf.setImage(with: URL(string: user[0].photo))
            }
        
            userPhoto.setRounded()
        
            ProfileNewsList.delegate = self
            ProfileNewsList.dataSource = self
    }

}

extension UIImageView {

   func setRounded() {
        self.layer.cornerRadius = self.frame.width / 2;
        self.layer.masksToBounds = true
        self.contentMode = .scaleAspectFill
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
