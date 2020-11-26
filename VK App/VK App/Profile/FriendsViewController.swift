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
        //UIImage(named: "user-ava.png")!,
        UIImage(named: "user-avatar.png")!,
        UIImage(named: "avatar-woman.png")!
    ]
    
    
    //var count: Int
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Цвет NavigationBar - BG & Title
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        
        friendList.backgroundColor = UIColor.white
        
        friendList.delegate = self
        friendList.dataSource = self
        
        //var count = self.friendsArray.count
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "ProfileViewController" else { return }
            guard let destination = segue.destination as? ProfileViewController else { return }
            destination.count = "\(friendsArray.count)"
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
        cell.backgroundColor = .white
        if cell.status.text == "Онлайн" {
            cell.status.textColor = .green
        }
        cell.userPhoto.image = avatarImages.randomElement()
        return cell
    }
    
    
    
}
