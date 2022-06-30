//
//  UserDefault+Util.swift
//  LemonadeTest
//
//  Created by Abdullah on 30/06/2022.
//

import Foundation

@propertyWrapper
struct UserDefaultCodable<T: Codable> {
    private let key: String
    private let defaultValue: T
    
    private let userDefaults = UserDefaults.standard
    
    init(key: String, default: T) {
        self.key = key
        self.defaultValue = `default`
    }
    
    var wrappedValue: T {
        get {
            guard let data = userDefaults.data(forKey: key) else {
                return defaultValue
            }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            userDefaults.set(data, forKey: key)
        }
    }
}
