//
//  ProfileViewController.swift
//  VK App
//
//  Created by Aleksander Pankow on 28/09/2020.
//

import UIKit

class ProfileViewController: UIViewController  {
    
    
    var user = UserModel(username: "outplay", password: "test", firstname: "Aleksander", lastname: "Pankow", phone: "884730857", dateofbirth: "18.04.1992", email: "aleksander.pankow@icloud.com")
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var friendsCount: UILabel!
    @IBOutlet weak var groupCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        nameLabel.text = "\(user.firstname) \(user.lastname)"
        usernameLabel.text = "@\(user.username)"
        //friendsCount.text = "\(countFriends.friendsArray.count)"
        
    }
    
    

}
