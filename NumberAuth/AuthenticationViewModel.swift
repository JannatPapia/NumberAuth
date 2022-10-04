//
//  AuthenticationViewModel.swift
//  NumberAuth
//
//  Created by Jannatun Nahar Papia on 5/10/22.
//

import Foundation
import Firebase
import GoogleSignIn

class AuthenticationViewModel: ObservableObject {

    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
      // 1
      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      // 2
      guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
      
      let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
      
      // 3
      Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
        if let error = error {
          print(error.localizedDescription)
        } else {
          self.state = .signedIn
        }
      }
    }

    
    
  // 1
    // create an enum SignInState to define the sign-in and sign-out state for Google Sign-In
  enum SignInState {
    case signedIn
    case signedOut
  }

  // 2
  @Published var state: SignInState = .signedOut  //@Published variable to manage the authentication state.
    
    
    
    func signIn() {
      // 1
        // You check if there’s a previous Sign-In. If yes, then restore it. Otherwise, move on to defining the sign-in process.
      if GIDSignIn.sharedInstance.hasPreviousSignIn() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
            authenticateUser(for: user, with: error)
        }
      } else {
        // 2
          // Get the clientID from Firebase App. It fetches the clientID from the GoogleService-Info.plist added to the project earlier.
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // 3
          //Create a Google Sign-In configuration object with the clientID.
        let configuration = GIDConfiguration(clientID: clientID)
        
        // 4
        //  As you’re not using view controllers to retrieve the presentingViewController, access it through the shared instance of the UIApplication. Note that directly using the UIWindow is now deprecated, and you should use the scene instead.
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
        
        // 5
          //Then, call signIn() from the shared instance of the GIDSignIn class to start the sign-in process. You pass the configuration object and the presenting controller.
        GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
          authenticateUser(for: user, with: error)
        }
      }
    }


    
    
    func signOut() {
      // 1
      GIDSignIn.sharedInstance.signOut()
      
      do {
        // 2
        try Auth.auth().signOut()
        
        state = .signedOut
      } catch {
        print(error.localizedDescription)
      }
    }
    
    
}

//func signIn() {
//  // 1
//    // You check if there’s a previous Sign-In. If yes, then restore it. Otherwise, move on to defining the sign-in process.
//  if GIDSignIn.sharedInstance.hasPreviousSignIn() {
//    GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
//        authenticateUser(for: user, with: error)
//    }
//  } else {
//    // 2
//      // Get the clientID from Firebase App. It fetches the clientID from the GoogleService-Info.plist added to the project earlier.
//    guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//
//    // 3
//      //Create a Google Sign-In configuration object with the clientID.
//    let configuration = GIDConfiguration(clientID: clientID)
//
//    // 4
//    //  As you’re not using view controllers to retrieve the presentingViewController, access it through the shared instance of the UIApplication. Note that directly using the UIWindow is now deprecated, and you should use the scene instead.
//    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
//    guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
//
//    // 5
//      //Then, call signIn() from the shared instance of the GIDSignIn class to start the sign-in process. You pass the configuration object and the presenting controller.
//    GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
//      authenticateUser(for: user, with: error)
//    }
//  }
//}
//
