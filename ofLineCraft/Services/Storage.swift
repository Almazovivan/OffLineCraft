//
//  Storage.swift
//  ofLineCraft
//
//  Created by Иван Алмазов on 17.03.2021.
//

import Foundation

protocol Storage {
    func put (object: Data, forKey key: String)
    func get (forKey key: String) -> Data?
    func remove (forKey key: String)
}

class UserDefaultsStorage: Storage {
    let defaults = UserDefaults.standard
    
    func put(object: Data, forKey key: String) {
        defaults.set(object, forKey: key)
    }
    
    func get(forKey key: String) -> Data? {
        return defaults.object(forKey: key) as? Data
    }
    
    func remove (forKey key: String) {
        defaults.removeObject(forKey: key)
    }
}
