//
//  ZaaraApp.swift
//  Zaara
//
//  Created by Aaditya Singh on 22/08/21.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct ZaaraApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            let viewModel = HomeViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure() 
        
        return true
    }
    
}
