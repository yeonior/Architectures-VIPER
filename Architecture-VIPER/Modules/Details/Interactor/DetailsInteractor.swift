//
//  DetailsInteractor.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 27.03.2022.
//

// for interactor
protocol DetailsInteractorInputProtocol {
    init(presenter: DetailsInteractorOutputProtocol, photo: Photo)
    func provideDetails()
}

// for presenter
protocol DetailsInteractorOutputProtocol: AnyObject {
    func receivePhotoDetails(with data: PhotoDetailsData)
}

final class DetailsInteractor: DetailsInteractorInputProtocol {
    
    unowned let presenter: DetailsInteractorOutputProtocol
    private let photo: Photo
    
    init(presenter: DetailsInteractorOutputProtocol, photo: Photo) {
        self.presenter = presenter
        self.photo = photo
    }
    
    func provideDetails() {
        let photoDetailsData = PhotoDetailsData(title: photo.title,
                                                stringURL: photo.stringURL)
        presenter.receivePhotoDetails(with: PhotoDetailsData(title: photoDetailsData.title,
                                                             stringURL: photoDetailsData.stringURL))
    }
}

