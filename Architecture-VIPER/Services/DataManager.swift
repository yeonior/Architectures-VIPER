//
//  DataManager.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 31.03.2022.
//

import Foundation

protocol DataManagerProtocol {
    func setFavouriteStatus(for name: String, with status: Bool)
    func getFavouriteStatus(for name: String) -> Bool
}

final class DataManager {
    static let shared = DataManager()
    private let userDefaults = UserDefaults()
    
    func setFavouriteStatus(for name: String, with status: Bool) {
        userDefaults.set(status, forKey: name)
    }
    
    func getFavouriteStatus(for name: String) -> Bool {
        userDefaults.bool(forKey: name)
    }
}
