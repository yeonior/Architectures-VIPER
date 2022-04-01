//
//  MainInteractor.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 26.02.2022.
//

// for interactor
protocol MainInteractorInputProtocol {
    init(presenter: MainInteractorOutputProtocol)
    func fetchPhotos()
}

// for presenter
protocol MainInteractorOutputProtocol: AnyObject {
    func photosDidReceived(_ photos: [Photo])
}

final class MainInteractor: MainInteractorInputProtocol {
    
    unowned let presenter: MainInteractorOutputProtocol
//    var photos: [Photo]?
    
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
}
