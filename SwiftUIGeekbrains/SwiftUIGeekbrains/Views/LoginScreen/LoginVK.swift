//
//  LoginVK.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 20/03/2022.
//

import SwiftUI
import WebKit

struct VKConstants {
    static let CLIENT_ID = "7870049"
    static let REDIRECT_URI = "https://oauth.vk.com/blank.html"
    static let SCOPE = "friends,wall,photos,groups,newsfeed,users"
    static let VERSION = "5.126"
}


struct LoginVK: UIViewRepresentable {
    
    fileprivate let navigationDelegate = WebViewNavigationDelegate()
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = navigationDelegate
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
    }
    
    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: VKConstants.CLIENT_ID),
            URLQueryItem(name: "scope", value: VKConstants.SCOPE),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: VKConstants.REDIRECT_URI),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: VKConstants.VERSION)
        ]
        
        return components.url.map { URLRequest(url: $0) }
    }
}

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
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
        
        guard let token = params["access_token"],
              let userIdString = params["user_id"],
              let _ = Int(userIdString)
        else {
            decisionHandler(.allow)
            return
        }
        
        UserDefaults.standard.set(token, forKey: "vkToken")
        UserDefaults.standard.set(userIdString, forKey: "vkId")
        print("Login successfull.")
        

        decisionHandler(.cancel)
    }
    
}
