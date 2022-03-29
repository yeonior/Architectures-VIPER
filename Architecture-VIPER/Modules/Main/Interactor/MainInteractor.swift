//
//  MainInteractor.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 26.02.2022.
//

// for interactor
protocol MainInteractorInputProtocol {
    init(presenter: MainInteractorOutputProtocol)
    func provideData()
}

// for presenter
protocol MainInteractorOutputProtocol: AnyObject {
    func receiveData(data: [Photo]?)
}

final class MainInteractor: MainInteractorInputProtocol {
    
    unowned let presenter: MainInteractorOutputProtocol
//    var photos: [Photo]?
    
    init(presenter: MainInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func provideData() {
//        NetworkManager.shared.getPhotos { [weak self] result in
//            switch result {
//            case .success(let photos):
//                let slice = photos?.prefix(upTo: 10)
////                self?.photos = Array(slice!)
//                self?.presenter.receiveData(data: Array(slice!))
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
}
