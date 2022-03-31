//
//  MainPresenter.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 26.02.2022.
//

struct PhotoData {
    // ...
}

final class MainPresenter: MainViewOutputProtocol {
    
    unowned let view: MainViewInputProtocol
    var interactor: MainInteractorInputProtocol!
    
    init(view: MainViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.provideData()
    }
}

// MARK: - MainInteractorOutputProtocol
extension MainPresenter: MainInteractorOutputProtocol {
    func receiveData(data: [PhotoData]?) {
        // preparing data
        // ...
    }
}
