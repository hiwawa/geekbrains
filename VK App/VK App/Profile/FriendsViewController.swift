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
    
    private var forecast = [ShortUserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Цвет NavigationBar - BG & Title
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        
        friendList.backgroundColor = UIColor.white
        
        friendList.delegate = self
        friendList.dataSource = self
        
        ApiRequest.loadFriends(token: NetworkSession.shared.token) { [weak self]
            friends in self?.forecast = friends
            self?.friendList.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "ProfileViewController" else { return }
            guard let destination = segue.destination as? ProfileViewController else { return }
            destination.count = "\(forecast.count)"
    }

}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as! FriendListCell
        cell.backgroundColor = .white
        
        cell.configure(with: forecast[indexPath.row])

        return cell
    }
    
    
    
}
