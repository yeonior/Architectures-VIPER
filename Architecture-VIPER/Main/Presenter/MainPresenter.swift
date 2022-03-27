//
//  MainPresenter.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 26.02.2022.
//

struct SomeData {
    // ...
}

final class MainPresenter: MainViewOutputProtocol {
    
    unowned let view: MainViewInputProtocol
    var interactor: MainInteractorInputProtocol!
    
    init(view: MainViewInputProtocol) {
        self.view = view
    }
    
    func didSelectCell() {
        interactor.provideData()
    }
}

// MARK: - MainInteractorOutputProtocol
extension MainPresenter: MainInteractorOutputProtocol {
    func receiveData(data: SomeData) {
        // preparing data to send to the view
        view.showInfo()
    }
}
