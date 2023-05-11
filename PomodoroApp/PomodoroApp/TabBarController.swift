//
//  TabBarController.swift
//  PomodoroApp
//
//  Created by Nursat Sakyshev on 11.05.2023.
//

import UIKit

enum Tabs: Int {
    case home
    case settings
    case history
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.barTintColor = Resources.Colors.inActive
        tabBar.layer.masksToBounds = true
        
        let mainController = ViewController()
        let settingsController = TableViewController()
        let historyController = HIstoryViewController()
        
        let mainNavigation = UINavigationController(rootViewController: mainController)
        let settingsNavigation = UINavigationController(rootViewController: settingsController)
        let historyNavigation = UINavigationController(rootViewController: historyController)
        
        mainNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.home, image: Resources.Images.TabBar.home, tag: Tabs.home.rawValue)
        settingsNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.settings, image: Resources.Images.TabBar.settings, tag: Tabs.settings.rawValue)
        historyNavigation.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.history, image: Resources.Images.TabBar.history, tag: Tabs.history.rawValue)
        
        setViewControllers([
            mainNavigation,
            settingsNavigation,
            historyNavigation
        ], animated: true)
    }
}
