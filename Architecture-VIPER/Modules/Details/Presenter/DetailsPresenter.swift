//
//  DetailsPresenter.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 27.03.2022.
//

struct PhotoDetailsData {
    let title: String
    let stringURL: String
}

final class DetailsPresenter: DetailsViewOutputProtocol {
    
    unowned let view: DetailsViewInputProtocol
    var interactor: DetailsInteractorInputProtocol!
    
    init(view: DetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideDetails()
    }
}

// MARK: - DetailsInteractorOutputProtocol
extension DetailsPresenter: DetailsInteractorOutputProtocol {
    func receivePhotoDetails(with data: PhotoDetailsData) {
        view.displayPhotoTitle(with: data.title)
    }
}
