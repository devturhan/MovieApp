//
//  UserDefaultsDataSource.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation
class UserDefaultsDataSource<T: Codable> {
    typealias ObjectType = T
    
    private var objectUserDefaultsKey: String
    private var defaults = UserDefaults.standard
    
    let lock: NSLock = NSLock()
    
    init(key: String) {
        self.objectUserDefaultsKey = key
    }
    
    func get() -> T? {
        lock.lock()
        defer { lock.unlock() }
        if let savedUserData = defaults.object(forKey: self.objectUserDefaultsKey) as? Data,
            let user = try? JSONDecoder().decode(T.self, from: savedUserData) {
            return user
        }
        return nil
    }
    
    func update(object: T) {
        lock.lock()
        defer { lock.unlock() }
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            defaults.set(encoded, forKey: self.objectUserDefaultsKey)
        }
    }
    
    func updateAndReturnObject(object: T) -> T? {
        self.update(object: object)
        return get()
    }
    
    func remove() {
        lock.lock()
        defer { lock.unlock() }
        defaults.removeObject(forKey: objectUserDefaultsKey)
    }
    
    func getStoreKey() -> String {
        return objectUserDefaultsKey
    }
    
}
