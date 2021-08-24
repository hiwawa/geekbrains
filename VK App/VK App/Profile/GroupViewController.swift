//
//  GroupViewController.swift
//  VK App
//
//  Created by Aleksander Pankow on 16/10/2020.
//

import UIKit
import RealmSwift
import Alamofire

protocol TableController: AnyObject{
    var groupsVK: [GroupModel]{ get set }
    func reloadData()
}

class GroupViewController: UIViewController, TableController {
    func reloadData() {
        groupList.reloadData()
    }
    
    var groupsVK: [GroupModel] = []
    
    @IBOutlet weak var groupList: UITableView!
    let opq = OperationQueue()
    
    let user = try? Realm().object(ofType: UserModel.self, forPrimaryKey: 1)
    
    private lazy var groups = try? Realm().objects(GroupList.self)
    
    var realmtoken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let params: Parameters = [
            "access_token": NetworkSession.shared.token,
            "extended": 1,
            "user_id": user?.id,
            "v": "5.126"
        ]
        
        //Цвет NavigationBar - BG & Title
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        groupList.backgroundColor = UIColor.white
        groupList.delegate = self
        groupList.dataSource = self
        
        

//            ApiRequest.loadGroups(token: NetworkSession.shared.token) { [weak self]
//                groups in try? RealmService.save(items: groups)
//                DispatchQueue.main.async {
//                    self?.groupList.reloadData()
//                }
//            }
        
        let request = AF.request("https://api.vk.com/method/groups.get",
                                 method: .get,
                                 parameters: params)
        let getDataOperation = GetDataOperation(request: request)
                opq.addOperation(getDataOperation)
                
                let parseData = ParseData()
                parseData.addDependency(getDataOperation)
                opq.addOperation(parseData)
                print(parseData)
                
                let reloadTableController = ReloadTableController(controller: self)
                reloadTableController.addDependency(parseData)
                OperationQueue.main.addOperation(reloadTableController)

        
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
