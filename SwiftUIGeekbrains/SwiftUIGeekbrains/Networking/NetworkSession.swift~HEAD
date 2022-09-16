//
//  NetworkSession.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 15/03/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkSession {
    static let session: Session = {
        let session = URLSessionConfiguration()
        session.timeoutIntervalForRequest = 60
        let afSession = Session(configuration: session)
        return afSession
    }()
    
    static let shared = NetworkSession()
    public var token: String = ""
    
}
