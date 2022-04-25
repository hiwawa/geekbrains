//
//  LoginView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 04/10/2021.
//
import Foundation
import SwiftUI

struct LoginView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = LoginViewController

    func makeUIViewController(context: Context) -> LoginViewController {
        let sb = UIStoryboard(name: "Login", bundle: nil)
        let viewController = sb.instantiateViewController(identifier: "Login") as! LoginViewController
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: LoginViewController, context: Context) {
        
    }
}
//struct LoginView: View {
//
//
//    @State var login: String = ""
//    @State var password: String = ""
//    @State private var showIncorrentCredentialsWarning = false
//
//    @Binding var isAutorized: Bool
//
//    var body: some View {
//        ZStack{
//
////            GeometryReader{ geometry in
////                Image("default-bg")
////            }
//
//            VStack{
//                ScrollView{
//
//                    Text("Please, Sign In")
//                        .padding(.vertical, 15)
//                        .font(.title)
//
//                    //Login Form
//                    LoginPasswordView(login: $login, password: $password)
//
//                    Button(action: verifyLoginData) {
//                        Label("Log in", systemImage: "key")
//                    }
//                    .padding([.vertical], 10)
//                    .disabled(login.isEmpty || password.isEmpty)
//
//                    Spacer()
//
//                }
//            }
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .frame(maxWidth: 250)
//            .padding([.leading, .trailing], 16)
//        }.onTapGesture {
//            UIApplication.shared.endEditing()
//        }.alert(
//            isPresented: $showIncorrentCredentialsWarning,
//            content: {
//                Alert(
//                    title: Text("Error"),
//                    message: Text("Incorrent Login/Password was entered")
//                )
//        })
//    }
//
//    //Check auth
//    private func verifyLoginData() {
//        if login == "123" && password == "123" {
//            isAutorized = true
//
//        } else {
//            showIncorrentCredentialsWarning = true
//        }
//        login = ""
//        password = ""
//    }
//
//}
//
//extension UIApplication{
//    func endEditing(){
//        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}
