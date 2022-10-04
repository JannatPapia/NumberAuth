//
//  NumberAuthApp.swift
//  NumberAuth
//
//  Created by Jannatun Nahar Papia on 15/9/22.
//

import SwiftUI
import Firebase
import GoogleSignIn


@main
struct NumberAuthApp: App {
    //MARK: google sign in
    @StateObject var viewModel = AuthenticationViewModel()
    //
 //   @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    // MARK: Google sign in
    init() {
      setupAuthentication()
    }
    //
    var body: some Scene {
        WindowGroup {
            ContentViewGoogle()
                .environmentObject(viewModel)
          //  ContentView()
        }
    }
}


// intializing Firebase...

//class AppDelegate: NSObject,UIApplicationDelegate{
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions
//                     launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//        FirebaseApp.configure()
//        return true
//    }
//
//    // Needed For Firebase Phone Auth....
//    func application(_ application: UIApplication, didReceiveRemoteNotification
//                     userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler:
//    @escaping (UIBackgroundFetchResult) -> Void) {
//
//    }
//}


// MARK: Google sign in
extension NumberAuthApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}
//
