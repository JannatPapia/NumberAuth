//
//  ContentView.swift
//  NumberAuth
//
//  Created by Jannatun Nahar Papia on 15/9/22.
//

import SwiftUI
import Firebase


struct ContentView: View {
    @AppStorage("log_Status") var status = false
    var body: some View {
        ZStack{
            if status{
                
                Home()
//                VStack(spacing: 15){
//
//                    // Home View.....
//                    Text("Logged In Successfully")
//                        .font(.title)
//                        .fontWeight(.heavy)
//                        .foregroundColor(Color.black)
//
//                    Button(action: {}, label: {
//                        Text("LogOut")
//                            .fontWeight(.heavy)
//                    })
//                }
                
            }
            else {
                NavigationView{
                        Login()
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                        }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
