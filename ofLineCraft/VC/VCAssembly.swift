//
//  VCAssembly.swift
//  ofLineCraft
//
//  Created by Иван Алмазов on 18.03.2021.
//

import UIKit

    class VCAssembly {
        private let storyboard = UIStoryboard(name: "Main", bundle: nil)
        private let game = Game()
        
        func chooseAvatarVC () -> ChooseAvatarVC {
          return storyboard.instantiateViewController(identifier: "ChooseAvatarVC") as! ChooseAvatarVC
        }
        
        func nicNameVC () -> NicNameVC {
            return storyboard.instantiateViewController(identifier: "NicNameVC") as! NicNameVC
        }
        
        func gameVC() -> GameVC {
            let gameVC = storyboard.instantiateViewController(identifier: "GameVC") as! GameVC
            gameVC.game = game
            let gameTabBarItam = UITabBarItem(title: "", image: UIImage(named: "man"), selectedImage: UIImage(named: "man"))
//            gameVC.tabBarController?.tabBar.tintColor = .black
//            gameVC.tabBarController?.tabBar.unselectedItemTintColor = .lightGray
            gameVC.tabBarItem = gameTabBarItam
            return gameVC
        }
        
        func shopVC () -> ShopVC {
            let shopVC = storyboard.instantiateViewController(identifier: "ShopVC") as! ShopVC
            shopVC.game = game
            
            let shopTabBarItam = UITabBarItem(title: "", image: UIImage(named: "shop"), selectedImage: UIImage(named: "shop"))
            
//            shopVC.tabBarController?.tabBar.tintColor = .white
//            shopVC.tabBarController?.tabBar.barTintColor = .white
//            shopVC.tabBarController?.tabBar.unselectedItemTintColor = .white
            shopVC.tabBarItem = shopTabBarItam
            
            return shopVC
        }
        
    }

