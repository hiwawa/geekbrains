//
//  ReloadTableController.swift
//  VK App
//
//  Created by Aleksander Pankow on 24/08/2021.
//

import Foundation
import UIKit

class ReloadTableController: Operation {
    var controller: TableController
    
    init(controller: TableController) {
        self.controller = controller
    }
    
    override func main() {
        guard let parseData = dependencies.first as? ParseData else { return }
        controller.groupsVK = parseData.outputData
        controller.reloadData()
  
  }
}
