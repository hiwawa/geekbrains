//
//  LoginViewController.swift
//  VK App
//
//  Created by Aleksander Pankow on 03/10/2020.
//

import UIKit
import Alamofire
import WebKit
import SwiftyJSON


class LoginViewController: UIViewController {
    
    @IBOutlet weak var vkLogin: WKWebView! {
        didSet {
            vkLogin.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7870049"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "friends,wall,photos,groups,newsfeed,users"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.126")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        vkLogin.load(request)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

}

extension LoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment else { decisionHandler(.allow); return }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        print(params)
        
        guard let token = params["access_token"],
            let userIdString = params["user_id"],
            let _ = Int(userIdString) else {
                decisionHandler(.allow)
                return
        }
        
        NetworkSession.shared.token = token
        performSegue(withIdentifier:"goProfile", sender: nil)
        //ApiRequest.loadFriends(token: NetworkSession.shared.token)
        
        decisionHandler(.cancel)
    }

}
