//
//  NetworkService.swift
//  NyaWeather
//
//  Created by Aleksander Pankow on 31/08/2021.
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
