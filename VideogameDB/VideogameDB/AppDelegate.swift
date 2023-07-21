//
//  AppDelegate.swift
//  VideogameDB
//
//  Created by Talha Dayanık on 19.07.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let mainNavigationController = UINavigationController(rootViewController: SplashViewController())
        window.rootViewController = mainNavigationController
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }
}

