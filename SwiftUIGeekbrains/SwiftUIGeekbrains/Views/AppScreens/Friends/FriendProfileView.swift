//
//  FriendProfileView.swift
//  SwiftUIGeekbrains
//
//  Created by Aleksander Pankow on 24/01/2022.
//

import SwiftUI

struct FriendProfileView: View {
    
    @Binding var firstName: String
    
    var body: some View {
        Text(firstName)
        
    }
}
