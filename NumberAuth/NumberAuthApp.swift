//
//  NumberAuthApp.swift
//  NumberAuth
//
//  Created by Jannatun Nahar Papia on 15/9/22.
//

import SwiftUI
import Firebase


@main
struct NumberAuthApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentViewGoogle()
          //  ContentView()
        }
    }
}


// intializing Firebase...

class AppDelegate: NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
    
    // Needed For Firebase Phone Auth....
    func application(_ application: UIApplication, didReceiveRemoteNotification
                     userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler:
    @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
}
