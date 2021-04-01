//
//  ChooseAvatarVC.swift
//  ofLineCraft
//
//  Created by Иван Алмазов on 16.03.2021.
//

import UIKit

protocol CallbackChooseAvatar: class {
    func secondVC (avatarName: String)
}
class ChooseAvatarVC: UIViewController {
    
    let itemsPerRow: CGFloat = 3
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    weak var callBack: CallbackChooseAvatar!
    
    @IBOutlet weak var avatarCollection: UICollectionView!
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touches = touches.first as? UITouch {
//            view.endEditing(true)
//        }
//        super.touchesBegan(touches, with: event)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarCollection.dataSource = self
        avatarCollection.delegate = self
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = avatarCollection.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        let layout = avatarCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: widthPerItem, height: widthPerItem)
        // отступ секции от границ экран
        layout.sectionInset = sectionInserts
        
        // отступы самой ячейки
        layout.minimumLineSpacing = sectionInserts.left
        layout.minimumInteritemSpacing = sectionInserts.left
        layout.scrollDirection = .vertical
        
        avatarCollection.showsVerticalScrollIndicator = false
    }
    


}

extension ChooseAvatarVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 17
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = avatarCollection.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as! AvatarCell
        cell.avatar.image = UIImage(named: "\(indexPath.item)")
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        callBack.secondVC(avatarName: "\(indexPath.item)")
    }
    
    
}


