//
//  LoginViewController.swift
//  VK App
//
//  Created by Aleksander Pankow on 03/10/2020.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var statusLabel: UILabel!
        
    
    @IBAction func loginButton(_ sender: Any) {
        
        if userField.text == "test" && passwordField.text == "test" {
            statusLabel.textColor = .green
            statusLabel.text = "Вы вошли"
            performSegue(withIdentifier: "goProfile", sender: self)
            
        } else {
            statusLabel.textColor = .red
            statusLabel.text = "Ошибка авторизации"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
