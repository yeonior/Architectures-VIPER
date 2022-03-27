//
//  DetailsInteractor.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 27.03.2022.
//

// for interactor
protocol DetailsInteractorInputProtocol {
    init(presenter: DetailsInteractorOutputProtocol, photo: Photo)
    func provideData()
}

// for presenter
protocol DetailsInteractorOutputProtocol: AnyObject {
    func receiveData(data: SomeData)
}

final class DetailsInteractorProtocol: DetailsInteractorInputProtocol {
    
    unowned let presenter: DetailsInteractorOutputProtocol
    let photo: Photo
    
    init(presenter: DetailsInteractorOutputProtocol, photo: Photo) {
        self.presenter = presenter
        self.photo = photo
    }
    
    func provideData() {
        // fetching data
    }
}
