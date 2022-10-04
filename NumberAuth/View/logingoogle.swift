//
//  logingoogle.swift
//  NumberAuth
//
//  Created by Jannatun Nahar Papia on 5/10/22.
//

import SwiftUI

struct logingoogle: View {
    var body: some View {
        VStack
        {
            // top image
            Image("icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: getRect().height / 3)
                .padding(.horizontal, 20)
                .offset(y: -10)
            // BAckground Circle....
                .background (
                Circle()
                    .fill(Color.blue)
                // Apllying Scale...
                //Simply Apply Scale from bottom....
                    .scaleEffect(2, anchor: .bottom)
                // Slighty moving....
                    .offset(y: 20)
                )
            
            // Text....
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct logingoogle_Previews: PreviewProvider {
    static var previews: some View {
        logingoogle()
    }
}

// Extending view to get screen bounds...
extension View {
    func getRect()-> CGRect{
        return UIScreen.main.bounds
    }
}
