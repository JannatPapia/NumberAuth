//
//  Home.swift
//  NumberAuth
//
//  Created by Jannatun Nahar Papia on 20/9/22.
//

import SwiftUI
import Firebase

struct Home: View {
    @AppStorage("log_Status") var status = false
    var body: some View {
        VStack(spacing: 15){

            // Home View.....
            Text("Logged In Successfully")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.black)

            Button(action: {
                // logging out....
                try? Auth.auth().signOut()
                withAnimation{status = false}
//                try Auth.auth().signOut()
//                withAnimation{status = false}
            }, label: {
                Text("LogOut")
                    .fontWeight(.heavy)
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
