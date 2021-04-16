//
//  Game.swift
//  ofLineCraft
//
//  Created by Иван Алмазов on 17.03.2021.
//
// MVVM
import UIKit
let key = "Dimon1"
class Game {
    
    private let adminPassword = "1"
    
    var userStorageService: UserStorageService = UserStorageServiceImpl()
    
    var user: User {
        set {
            userStorageService.put(user: newValue, forKey: key)
        } get {
           return userStorageService.get(forKey: key)!
        }
    }
    
    func addCoins(vc: UIViewController, closure: @escaping (_ coins: String) -> Void ) {
        let alert = UIAlertController(title: "Добавить & Убрать", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (texfield) in
            texfield.placeholder = "Пароль админа"
            texfield.isSecureTextEntry = true
        }
        
        alert.addTextField { (texfield) in
            texfield.placeholder = "Введите число"
        }
        
        // Блок handler вызывается при нажатии на action1
        let action1 = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        let action2 = UIAlertAction(title: "Ok", style: .cancel) { (action) in
           
            if alert.textFields![0].text != self.adminPassword {
                self.alertError(vc: vc, title: "Вы ввели неверный пароль админа")
                return
            }
            // Добавить новую запись
            guard let newItem = alert.textFields![1].text, self.isStringAnInt(string: newItem) else {
                self.alertError(vc: vc, title: "Ошибка, введите число")
                return
            }
            self.user.coins += Int(newItem)!
            closure(String(self.user.coins))
            print(newItem)
        }
        
        alert.addAction(action1)
        alert.addAction(action2)
        
        vc.present(alert, animated: true, completion: nil)
    }
    
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    func alertError(vc: UIViewController, title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alert.addAction(action)
        
        vc.present(alert, animated: true, completion: nil)
    }

}
