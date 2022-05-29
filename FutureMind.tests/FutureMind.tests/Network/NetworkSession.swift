//
//  NetworkSession.swift
//  FutureMind.tests
//
//  Created by Aleksander Pankow on 27/05/2022.
//

import Foundation
import Alamofire

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
