//
//  ViewController.swift
//  VK App
//
//  Created by Aleksander Pankow on 26/09/2020.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBAction func loginButton() {
        if userInput.text == "test" && passwordInput.text == "test" {
            statusLabel.textColor = .green
            statusLabel.text = "Вы вошли"
            
        } else {
            statusLabel.textColor = .red
            statusLabel.text = "Ошибка авторизации"
        }
    }
    
    @IBAction func logoutButton() {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

