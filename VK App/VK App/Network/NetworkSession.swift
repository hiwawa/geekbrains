//
//  CustomSession.swift
//  VK App
//
//  Created by Aleksander Pankow on 25/12/2020.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkSession {
    static let session: SessionManager = {
        let session = URLSessionConfiguration()
        session.timeoutIntervalForRequest = 60
        let afSession = SessionManager(configuration: session)
        return afSession
    }()
    
    static let shared = NetworkSession()
    public var token: String = ""
    
}
