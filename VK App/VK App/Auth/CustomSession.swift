//
//  CustomSession.swift
//  VK App
//
//  Created by Aleksander Pankow on 25/12/2020.
//

import Foundation
import Alamofire

extension Session {
    static let custom: Session = {
        let configuration = URLSessionConfiguration.default
        let sessionManager = Session(configuration: configuration)
        return sessionManager
    }()
}
