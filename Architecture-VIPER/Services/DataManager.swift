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
    func setPhotos(_ photos: [Photo])
    func getPhoto(at indexPath: IndexPath) -> Photo
}

final class DataManager: DataManagerProtocol {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    private var photos: [Photo] = []
    
    private init() {}
    
    func setFavouriteStatus(for name: String, with status: Bool) {
        userDefaults.set(status, forKey: name)
    }
    
    func getFavouriteStatus(for name: String) -> Bool {
        userDefaults.bool(forKey: name)
    }
    
    func setPhotos(_ photos: [Photo]) {
        self.photos = photos
    }
    
    func getPhoto(at indexPath: IndexPath) -> Photo {
        photos[indexPath.row]
    }
}
