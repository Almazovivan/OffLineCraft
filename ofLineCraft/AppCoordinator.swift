//
//  AppCoordinator.swift
//  ofLineCraft
//
//  Created by Иван Алмазов on 16.03.2021.
//

import UIKit

class AppCoordinator {
    
    private let userStorage: UserStorageService = UserStorageServiceImpl()
    
    private let vcAssembly = VCAssembly()
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let tabBarVC = MainTabBarController()
    
    var firstVC: ChooseAvatarVC?
    
    func run (in window: UIWindow) {
        
//        userStorage.remove(forKey: key)
        if let _ = userStorage.get(forKey: key) {
            
            let gameVC = vcAssembly.gameVC()
            let shopVC = vcAssembly.shopVC()
           
            tabBarVC.setViewControllers([gameVC, shopVC], animated: true)
            window.rootViewController = tabBarVC
            window.makeKeyAndVisible()
        } else {
            let chooseAvatarVC = vcAssembly.chooseAvatarVC()
            chooseAvatarVC.callBack = self
            firstVC =  chooseAvatarVC
            window.rootViewController = chooseAvatarVC
            window.makeKeyAndVisible()
        }
    }
}

extension AppCoordinator: CallbackChooseAvatar {
    func secondVC(avatarName: String) {
        let nicNameVC = vcAssembly.nicNameVC()
        nicNameVC.avatarImageName = avatarName
        nicNameVC.callBack = self
        firstVC?.present(nicNameVC, animated: true, completion: nil)
    }
}

extension AppCoordinator: CallBackNicName {
    func endNicNameVC(avatarName: String, name: String, vc: NicNameVC) {
        
        let user = User(name: name, avatarName: avatarName)
        userStorage.put(user: user, forKey: key)
        let gameVC = vcAssembly.gameVC()
        let shopVC = vcAssembly.shopVC()
       
        tabBarVC.setViewControllers([gameVC, shopVC], animated: true)
        tabBarVC.modalPresentationStyle = .fullScreen
        vc.present(tabBarVC, animated: true, completion: nil)
    }
}
