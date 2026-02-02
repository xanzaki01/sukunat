//
//  AppDelegate.swift
//  sukunat
//
//  Created by Xan Xanzaki on 17/11/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let entry = EntryVC()
        let navVC = UINavigationController(rootViewController: entry)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        setUPNavigationBar()
        
        return true
    }
    func setUPNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        
            
    }
}

