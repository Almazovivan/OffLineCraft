//
//  UserService.swift
//  ofLineCraft
//
//  Created by Иван Алмазов on 18.03.2021.
//

import Foundation

protocol UserStorageService {
    func put(user: User, forKey: String)
    func get(forKey: String) -> User?
    func remove(forKey: String)
}

class UserStorageServiceImpl: UserStorageService {
    
    var storage: Storage = UserDefaultsStorage()
    
    func put (user: User, forKey: String) {
        do {
        let data = try JSONEncoder().encode(user)
            storage.put(object: data, forKey: key)
        }
        catch let error  {
            print(error.localizedDescription)
        }
    }
    
    func get(forKey: String) -> User? {
        guard let data = storage.get(forKey: forKey) else { return nil }
        do {
        let user = try JSONDecoder().decode(User.self, from: data)
            return user
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func remove(forKey: String) {
        storage.remove(forKey: forKey)
    }
}
