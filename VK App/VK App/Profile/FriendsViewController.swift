//
//  FriendsViewController.swift
//  VK App
//
//  Created by Aleksander Pankow on 03/10/2020.
//

import UIKit
import RealmSwift

class FriendsViewController: UIViewController {

    @IBOutlet weak var addFriend: UIBarButtonItem!
    @IBOutlet var friendList: UITableView!

    private lazy var friends = try? Realm().objects(FriendList.self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Цвет NavigationBar - BG & Title
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        
        friendList.backgroundColor = UIColor.white
        friendList.delegate = self
        friendList.dataSource = self
        
        DispatchQueue.global().async {
        
            ApiRequest.loadFriends(token: NetworkSession.shared.token) { [weak self]
                friends in try? RealmService.save(items: friends)
                DispatchQueue.main.async {
                    self?.friendList.reloadData()
                }
            }
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "ProfileViewController" else { return }
            guard let destination = segue.destination as? ProfileViewController else { return }
    }

}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendListCell,
            let friend = friends?[indexPath.item]
            else { return UITableViewCell() }
        
        cell.configure(with: friend)
        cell.backgroundColor = .white
        
        return cell
    }
    
}
