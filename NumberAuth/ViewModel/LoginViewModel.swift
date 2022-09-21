//
//  LoginViewModel.swift
//  NumberAuth
//
//  Created by Jannatun Nahar Papia on 16/9/22.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
   
    @Published var phNo = ""
    @Published var code = "880"
    @Published var codee = ""
    
    // getting country phone code
    
    // DataModel For Error View...
    @Published var errorMsg = ""
    @Published var error = false
    
        // Storing CODE for verification....
    @Published var CODE =  ""
    
    @Published var gotoVerify = false
    
    // User logged status...
    @AppStorage("log_Status") var status = false
    
    // Loading view..
    @Published var loading = false
    
//    func getCountryCode()-> String{
//
//        let regionCode = Locale.current.regionCode ?? ""
//        return countries[regionCode] ?? ""
//    }
    
    // sending Code to user
    
    func sendCode(){
        
        // enabling testing code...
        // disable when you need to test with real device...
        
        Auth.auth().settings?.isAppVerificationDisabledForTesting = false
        
      //  let number = "+\(getCountryCode())\(phNo)"
        let number = "+\(code)\(phNo)"
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil){
        (CODE, err) in
        if let error = err{
            self.errorMsg = error.localizedDescription
            withAnimation{ self.error.toggle()}
            return
        }
            self.CODE = CODE ?? ""
            self.gotoVerify = true
    }
}
    
    func verifyCode(){
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.CODE, verificationCode: codee)
        
        loading = true
        
        Auth.auth().signIn(with: credential) { (result, err) in
            self.loading = false
            
            if let error = err{
                self.errorMsg = error.localizedDescription
                withAnimation{self.error.toggle()}
                return
            }
            // else user logged in Successfully
            withAnimation{self.status = true}
         //   self.status = true
        }
    }
    
    func requestCode(){
        sendCode()
        withAnimation{
            self.errorMsg = "Code Sent Successfully !!!"
            self.error.toggle()
        }
    }
}

