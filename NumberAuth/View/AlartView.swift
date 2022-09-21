//
//  AlartView.swift
//  NumberAuth
//
//  Created by Jannatun Nahar Papia on 19/9/22.
//

import SwiftUI

struct AlartView: View {
    var msg: String
    @Binding var show: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Text("Message")
                .fontWeight(.bold)
                .foregroundColor(Color.gray)
            
            Text(msg)
                .foregroundColor(Color.gray)
            
            
            Button(action: {
                // closing popup
                    show.toggle()
                
            }, label: {
                Text("Close")
                    .foregroundColor(Color.black)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .background(Color.yellow.opacity(0.6))
                    .cornerRadius(15)
            })
            // centering the button
            .frame(alignment: .center)
        })
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .padding(.horizontal, 25)
        
        // background dim....
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.3).ignoresSafeArea())
    }
}


