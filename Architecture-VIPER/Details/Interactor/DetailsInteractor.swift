//
//  DetailsInteractor.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 27.03.2022.
//

// for interactor
protocol DetailsInteractorInputProtocol {
    init(presenter: DetailsInteractorOutputProtocol)
    func provideData()
}

// for presenter
protocol DetailsInteractorOutputProtocol: AnyObject {
    func receiveData(data: SomeData)
}

final class DetailsInteractorProtocol: DetailsInteractorInputProtocol {
    
    unowned let presenter: DetailsInteractorOutputProtocol
    
    init(presenter: DetailsInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func provideData() {
        // fetching data
    }
}
