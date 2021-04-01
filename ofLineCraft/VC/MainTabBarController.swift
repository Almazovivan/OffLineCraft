//
//  MainTabBarController.swift
//  ofLineCraft
//
//  Created by Иван Алмазов on 18.03.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        UITabBar.appearance().isTranslucent = false
//        UITabBar.appearance().backgroundColor = UIColor.clear
////        UITabBar.appearance().backgroundImage = UIImage(named: "footer")
//        UITabBar.appearance().contentMode = .scaleAspectFill
        
        let tabBar = self.tabBar
        tabBar.backgroundImage = UIImage(named: "footer")
        tabBar.clipsToBounds = true
        tabBar.autoresizesSubviews = true
        tabBar.contentMode = .scaleAspectFill
        tabBar.backgroundColor = UIColor.clear
        
        let shopTabBarItam = UITabBarItem(title: "", image: UIImage(named: "shop"), selectedImage: UIImage(named: "shop"))
        tabBar.tintColor = .white
        tabBar.barTintColor = .white
        tabBar.unselectedItemTintColor = .white
        self.tabBarItem = shopTabBarItam
    }

}
