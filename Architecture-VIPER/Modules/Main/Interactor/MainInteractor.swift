//
//  MainInteractor.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 26.02.2022.
//

import Foundation

// for interactor
protocol MainInteractorInputProtocol {
    init(presenter: MainInteractorOutputProtocol)
    func fetchPhotos()
    func providePhoto(at indexPath: IndexPath)
}

// for presenter
protocol MainInteractorOutputProtocol: AnyObject {
    func photosDidReceived(_ photos: [Photo])
    func photoDidReceive(_ photo: Photo)
}

final class MainInteractor: MainInteractorInputProtocol {
    
    unowned let presenter: MainInteractorOutputProtocol
    
    init(presenter: MainInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchPhotos() {
        NetworkManager.shared.getPhotos { [weak self] result in
            switch result {
            case .success(let photos):
                let slice = photos?.prefix(upTo: 10)
                self?.presenter.photosDidReceived(Array(slice!))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func providePhoto(at indexPath: IndexPath) {
        let photo = DataManager.shared.getPhoto(at: indexPath)
        presenter.photoDidReceive(photo)
    }
}
