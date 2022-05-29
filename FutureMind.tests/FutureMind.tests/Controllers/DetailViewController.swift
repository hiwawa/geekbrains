//
//  DetailViewController.swift
//  FutureMind.tests
//
//  Created by Aleksander Pankow on 28/05/2022.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailView: WKWebView!
    var data: DataModel?
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: url)
        print(url)
        let myRequest = URLRequest(url: ((myURL) ?? URL(string:"https://google.com"))!)
        detailView.load(myRequest)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
