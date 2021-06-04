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
    var realmtoken: NotificationToken?
    
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
        
        notification()
        
        // Do any additional setup after loading the view.
    }
    
    func notification() {
        
        self.realmtoken = groups?.observe {  (changes: RealmCollectionChange) in
            switch changes {
            case .initial(let results):
                print(results)
            case let .update(results, deletions, insertions, modifications):
                print(results,
                      "удалено: \(deletions)",
                      "добавлено: \(insertions)",
                      "изменено:\(modifications)")
            case .error(let error):
                print(error)
            }
            print("Данные изменились")
        }
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
