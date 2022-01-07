//
//  MainViewController.swift
//  WhoBilly
//
//  Created by Aleksander Pankow on 02/01/2022.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var startGame: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
            case "to_gameVC": break
            default:
                break
        }
    }
    
}
