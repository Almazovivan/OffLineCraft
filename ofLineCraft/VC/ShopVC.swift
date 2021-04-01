//
//  ShopVC.swift
//  ofLineCraft
//
//  Created by Иван Алмазов on 18.03.2021.
//

import UIKit

class ShopVC: UIViewController {
    var game: Game! // injectet

    @IBOutlet weak var shopCollection: UICollectionView!
    
    private let itemsPerRow: CGFloat = 1
    private let sectionInserts = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shopCollection.delegate = self
        shopCollection.dataSource = self
        shopCollection.showsVerticalScrollIndicator = false
        print("Shop")
        let vc = tabBarController?.viewControllers![0] as? GameVC
    }
    
    private func setupFlowLayout() {


//        // отступ секции от границ экран
//        layout.sectionInset = sectionInserts
//
//        // отступы самой ячейки
//        layout.minimumLineSpacing = sectionInserts.left
//        layout.minimumInteritemSpacing = sectionInserts.left
//        layout.scrollDirection = .vertical
//
//        shopCollection.showsVerticalScrollIndicator = false
    }
}

extension ShopVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = shopCollection.dequeueReusableCell(withReuseIdentifier: "ShopCell", for: indexPath) as! ShopCell
        cell.imageShop.image = UIImage(named: "7")
        return cell
    }
}

extension ShopVC: UICollectionViewDelegateFlowLayout {
    
    // MARK: - Размеры ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow: CGFloat = 4
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = shopCollection.frame.width - paddingWidth - 1
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    // MARK: - Отступы всей коллекции (отступы от крайних ячеек)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
      // MARK: - Отступы сверху и снизу у ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.bottom
    }
    
      // MARK: - Отступы спава слева от ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.right
    }
}
