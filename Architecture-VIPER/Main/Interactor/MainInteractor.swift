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
    func receiveData(data: SomeData)
}

final class MainInteractor: MainInteractorInputProtocol {
    
    unowned let presenter: MainInteractorOutputProtocol
    
    init(presenter: MainInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func provideData() {
        // fetching data
    }
}
