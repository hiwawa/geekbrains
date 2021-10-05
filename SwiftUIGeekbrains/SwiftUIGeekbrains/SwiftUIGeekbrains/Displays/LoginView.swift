//
//  LoginView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 04/10/2021.
//

import SwiftUI

struct LoginView: View {
    
    
    @State var login: String = ""
    @State var password: String = ""
    
    
    var body: some View {
        ZStack{
            
            GeometryReader{ geometry in
                Image("default-bg")
            }
            
            VStack{
                ScrollView{
                    
                    Text("Please, Sign In")
                        .padding(.vertical, 15)
                        .font(.title)
                    
                    HStack{
                        Spacer()
                        Text("Login")
                        Spacer()
                        TextField("Enter E-mail adress...", text: $login)
                            .frame(maxWidth: 150)
                    }
                    
                    HStack{
                        Spacer()
                        Text("Password")
                        Spacer()
                        TextField("Enter password...", text: $password)
                            .frame(maxWidth: 150)
                    }
                    
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        Label("Log in", systemImage: "key")
                    }
                    .padding([.vertical], 10)
                    
                    Spacer()
                    
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(maxWidth: 250)
            .padding([.leading, .trailing], 16)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
