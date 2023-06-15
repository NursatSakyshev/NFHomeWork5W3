//
//  Resources.swift
//  PomodoroApp
//
//  Created by Nursat Sakyshev on 11.05.2023.
//

import UIKit

enum Resources {
    enum Colors {
        static var active = UIColor.white
        static var inActive = UIColor.white
        static var separator = UIColor.clear
    }
    
    enum Strings {
        enum TabBar {
            static var home = "Home"
            static var settings = "Settings"
            static var history = "History"
        }
    }
    
    enum Images {
        enum TabBar {
            static var home = UIImage(named: "homeHeart")
            static var settings = UIImage(named: "Settings")
            static var history = UIImage(named: "file")
        }
    }
}
