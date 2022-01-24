//
//  LoginPasswordView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 23/01/2022.
//

import SwiftUI

struct LoginPasswordView: View {
    
    @Binding var login: String
    @Binding var password: String
    
    var body: some View {
        HStack{
            Text("Login")
            Spacer()
            TextField("Enter E-mail adress...", text: $login)
                .frame(maxWidth: 150)
                .keyboardType(.default)
        }
        
        HStack{
            Text("Password")
            Spacer()
            SecureField("Enter password...", text: $password)
                .frame(maxWidth: 150)
                .keyboardType(.default)
        }
    }
}
