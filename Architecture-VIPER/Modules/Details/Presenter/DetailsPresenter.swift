//
//  DetailsPresenter.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 27.03.2022.
//

final class DetailsPresenter: DetailsViewOutputProtocol {
    
    unowned let view: DetailsViewInputProtocol
    var interactor: DetailsInteractorInputProtocol!
    
    init(view: DetailsViewInputProtocol) {
        self.view = view
    }
}

// MARK: - DetailsInteractorOutputProtocol
extension DetailsPresenter: DetailsInteractorOutputProtocol {
    func receiveData(data: SomeData) {
        // preparing data to send to the view
        view.someFunc(with: data)
    }
}
