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
        let mainVC = ViewController()
        let settingsVC = TableViewController()
        let historyVC = HIstoryViewController()
        
        let mainNavController = UINavigationController(rootViewController: mainVC)
        let settingsNavController = UINavigationController(rootViewController: settingsVC)
        let historyNavController = UINavigationController(rootViewController: historyVC)
        
//        let tabBarVC = UITabBarController()
        let tabBarVC = TabBarController()
//        tabBarVC.setViewControllers([mainNavController, settingsNavController, historyNavController], animated: true)
        
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarVC
//        window?.rootViewController = ViewController()
//        window?.rootViewController = TableViewController()
//        window?.rootViewController = TestViewController()
//        window?.rootViewController = HistoryTableViewController()
//        window?.rootViewController = HIstoryViewController()
        
        return true
    }
}

