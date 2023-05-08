//
//  AppDelegate.swift
//  PomodoroApp
//
//  Created by Nursat Sakyshev on 07.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = ViewController()
//        window?.rootViewController = TableViewController()
        
        return true
    }
}

