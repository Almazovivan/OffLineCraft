//
//  NicNameVC.swift
//  ofLineCraft
//
//  Created by Иван Алмазов on 16.03.2021.
//

import UIKit
protocol CallBackNicName: class {
    func endNicNameVC (avatarName: String, name: String, vc: NicNameVC)
}
class NicNameVC: UIViewController, UITextFieldDelegate {
    
    var avatarImageName: String!
    weak var callBack: CallBackNicName!

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var texNicName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatar.image = UIImage(named: avatarImageName)
        texNicName.delegate = self
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func beginGame(_ sender: Any) {
        if let nic = texNicName.text, nic.isEmpty{
            alert(message: "Введите ник")
        } else {

            callBack.endNicNameVC(avatarName: avatarImageName, name: texNicName.text!, vc: self)
        }
    }
    
    func alert(message: String) {
       
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
}
