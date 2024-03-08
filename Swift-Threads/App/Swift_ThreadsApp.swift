//
//  Swift_ThreadsApp.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 07/02/2024.
//

import SwiftUI
import FirebaseCore // add here

// add class
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct Swift_ThreadsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate // add here
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
