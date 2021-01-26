//
//  GroupViewController.swift
//  VK App
//
//  Created by Aleksander Pankow on 16/10/2020.
//

import UIKit

class GroupViewController: UIViewController {
    
    @IBOutlet weak var groupList: UITableView!
    
    private var forecast = [ShortGroupModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Цвет NavigationBar - BG & Title
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        groupList.backgroundColor = UIColor.white
        groupList.delegate = self
        groupList.dataSource = self
        
        ApiRequest.loadGroups(token: NetworkSession.shared.token) { [weak self]
            groups in self?.forecast = groups
            self?.groupList.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }
    
}

extension GroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as! GroupListCell
 
        cell.backgroundColor = .white
        cell.configure(with: forecast[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            // Если была нажата кнопка «Удалить»
            if editingStyle == .delete {
            // Удаляем город из массива
                forecast.remove(at: indexPath.row)
            // И удаляем строку из таблицы
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    
}
