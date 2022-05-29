//
//  ViewController.swift
//  FutureMind.tests
//
//  Created by Aleksander Pankow on 27/05/2022.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var dataList: UITableView!
    private lazy var datas = try? Realm().objects(DataModel.self).sorted(byKeyPath: "id", ascending: true)
    @IBAction func updateData(_ sender: Any) {
        ApiRequest.loadData() {
            datas in try? RealmService.save(items: datas)
            self.dataList.reloadData()
        }
    }
    
    var realmtoken: NotificationToken?
    
    func notification() {
        
        self.realmtoken = datas?.observe {  (changes: RealmCollectionChange) in
            switch changes {
            case .initial(let results):
                print(results)
            case let .update(results, deletions, insertions, modifications):
                print(results,
                      "deleted: \(deletions)",
                      "added: \(insertions)",
                      "changed:\(modifications)")
            case .error(let error):
                print(error)
            }
            print("Data is changed!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataList.delegate = self
        dataList.dataSource = self
        dataList.separatorInset = .zero
        dataList.contentInset = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: -15);
        
        ApiRequest.loadData() {
            datas in try? RealmService.save(items: datas)
            self.dataList.reloadData()
        }
        
        notification()
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as? DataListCell,
            let data = datas?[indexPath.item]
        else { return UITableViewCell() }
        
        cell.configure(with: data)
        cell.clipsToBounds = true
        return cell
    }
    
}
