//
//  Verification.swift
//  NumberAuth
//
//  Created by Jannatun Nahar Papia on 19/9/22.
//

import SwiftUI

struct Verification: View {
    @ObservedObject var loginData : LoginViewModel
    @Environment(\.presentationMode) var present
    var body: some View {
        ZStack{
        VStack{
        VStack{
            HStack{
                Button(action: {present.wrappedValue.dismiss()}){
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
                Spacer()
                
                Text("Verify Phone")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                Spacer()
                
                if loginData.loading{ProgressView()}
            }
            
            .padding()
           
            
            Text("Code sent to \(loginData.phNo)")
                .foregroundColor(Color.gray)
                .padding(.bottom)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 15){
                ForEach(0..<6,id: \.self){index in
                    //displaying code....
                    
                    CodeView(code: getCodeAtIndex(index: index))
                    
                }
            }
            .padding()
            .padding(.horizontal, 20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6){
                Text("Did't receive code?")
                    .foregroundColor(Color.gray)
                
                Button(action: loginData.requestCode){
                    Text("Request Again")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
            }
            
                Button(action: {}){
                    Text("Get via call")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                }
                .padding(.top, 6)
            
            Button(action: loginData.verifyCode){
                Text("Verify and create Account")
                    .foregroundColor(Color.black)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .background(Color.yellow.opacity(0.6))
                    .cornerRadius(15)
            }
            .padding()
        }
        .frame(height: UIScreen.main.bounds.height / 1.8)
        .background(Color.white)
        .cornerRadius(20)
            
            CustomNumberPad(value: $loginData.codee, isVerify: true)
          //  Spacer()
    }
        .background(Color.gray.opacity(0.2)).ignoresSafeArea(.all, edges: .bottom)
            
            
            if loginData.error{
                AlartView(msg: loginData.errorMsg, show: $loginData.error)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
            
    }
    // getting code at each index....
    
    func getCodeAtIndex(index: Int)->String{
        if loginData.codee.count > index{
            let start = loginData.codee.startIndex
            let current = loginData.codee.index(start, offsetBy: index)
            
            return String(loginData.codee[current])
        }
        return ""
    }
   
}


struct CodeView: View {
    var code : String
    var body: some View{
        VStack(spacing: 10){
            Text(code)
                .foregroundColor(Color.blue)
                .font(.title2)
            // default frame....
                .frame(height: 45)
            
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(height: 4)
        }
    }
}
