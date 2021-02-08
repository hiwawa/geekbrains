//
//  GroupViewController.swift
//  VK App
//
//  Created by Aleksander Pankow on 16/10/2020.
//

import UIKit
import RealmSwift

class GroupViewController: UIViewController {
    
    @IBOutlet weak var groupList: UITableView!
    
    private lazy var groups = try? Realm().objects(GroupList.self)
    
    //private var forecast = [GroupModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Цвет NavigationBar - BG & Title
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        groupList.backgroundColor = UIColor.white
        groupList.delegate = self
        groupList.dataSource = self
        
        ApiRequest.loadGroups(token: NetworkSession.shared.token) { [weak self]
            groups in try? RealmService.save(items: groups)
            self?.groupList.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }
    
}

extension GroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupListCell,
            let group = groups?[indexPath.item]
            else { return UITableViewCell() }
        
        cell.configure(with: group)
        return cell
    }
    
}
