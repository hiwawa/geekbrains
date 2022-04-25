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


struct WebView : UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}

struct LoginVK: View {
    
    @State var isLogginIn = false
    let authURLFull = "https://oauth.vk.com/authorize?response_type=token&display=mobile&client_id=" + VKConstants.CLIENT_ID + "&scope=" + VKConstants.SCOPE + "&redirect_uri=" + VKConstants.REDIRECT_URI + "&v=" + VKConstants.VERSION
    
    var body: some View {
        Button("VK Login") {
            isLogginIn = true
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.green)
        .clipShape(Capsule())
        .sheet(isPresented: $isLogginIn) {
            WebView(request: URLRequest(url: URL(string: authURLFull)! ))
        }
    }
}

extension LoginVK {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        RequestForCallbackURL(request: navigationAction.request)
    }

    func RequestForCallbackURL(request: URLRequest) {
        let requestURLString = (request.url?.absoluteString)! as String
        print(requestURLString)
    }

}
