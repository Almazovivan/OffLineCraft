//
//  GameVC.swift
//  ofLineCraft
//
//  Created by Иван Алмазов on 17.03.2021.
//

import UIKit

class GameVC: UIViewController {
    
    var user: User?
    var game: Game! // injectet
    
    @IBOutlet weak var coins: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var avatarView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user = game.user
        coins.text = String(user!.coins)
        status.text = user!.status.rawValue
        avatarView.image = UIImage(named: user!.avatarName)
        
        print("Game")
    }
    
    func prints() {
        print("check")
    }
    @IBAction func changeCoins(_ sender: UIButton) {
//        print(sender.titleLabel?.text)
        game.addCoins(vc: self) { (newCoins) in
            self.coins.text = newCoins
        }
    
}

//    func addCoins() {
//        let alert = UIAlertController(title: "Добавить задачу", message: nil, preferredStyle: .alert)
//        
//        alert.addTextField { (texfield) in
//            texfield.placeholder = "Пароль админа"
//            texfield.isSecureTextEntry = true
//        }
//        
//        alert.addTextField { (texfield) in
//            texfield.placeholder = "Введите число"
//        }
//        
//        // Блок handler вызывается при нажатии на action1
//        let action1 = UIAlertAction(title: "Cancel", style: .default, handler: nil)
//        let action2 = UIAlertAction(title: "Ok", style: .cancel) { (action) in
//           
//            // Добавить новую запись
//            guard let newItem = alert.textFields![1].text, self.isStringAnInt(string: newItem) else { return }
//            
//            print(newItem)
//        }
//        
//        alert.addAction(action1)
//        alert.addAction(action2)
//        
//        self.present(alert, animated: true, completion: nil)
//    }
//    
//    func isStringAnInt(string: String) -> Bool {
//        return Int(string) != nil
//    }
    
    
}
