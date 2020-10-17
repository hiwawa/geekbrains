//
//  FriendsViewController.swift
//  VK App
//
//  Created by Aleksander Pankow on 03/10/2020.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var addFriend: UIBarButtonItem!
    @IBOutlet var friendList: UITableView!
    
    var friendsArray = ["Иван Иванов", "Алексей Семенов", "Екатерина Зайцева"]
    var statusArray = ["Онлайн", "Оффлайн"]
    var avatarImages: [UIImage] = [
        UIImage(named: "user-ava.png")!,
        UIImage(named: "user-avatar.png")!,
        UIImage(named: "avatar-woman.png")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendList.delegate = self
        friendList.dataSource = self
        
        var friendsCount = self.friendsArray.count
        
        // Do any additional setup after loading the view.
    }

}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as! FriendListCell
 
        cell.friendName.text = friendsArray[indexPath.row]
        cell.status.text = statusArray.randomElement()
        if cell.status.text == "Онлайн" {
            cell.status.textColor = .green
        }
        cell.userPhoto.image = avatarImages.randomElement()
        return cell
    }
    
    
    
}
