//
//  Stacktest_iosApp.swift
//  Stacktest-ios
//
//  Created by СОВА on 14.06.2022.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
//      FirebaseData.shared.startGet()
     
    return true
  }
}


@main
struct Stacktest_iosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State var localeBool = UserDefaults.standard.bool(forKey: "LocationBool")
    
    var body: some Scene {
        WindowGroup {
            if localeBool {
                ContentView()
            } else {
                StartView(localeBool: $localeBool)
            }
            
        }
    }
}
