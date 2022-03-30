//
//  DetailsInteractor.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 27.03.2022.
//

import Foundation

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
        
        // preparing the data
        let imageData = NetworkManager.shared.getData(from: photo.stringURL)
        let photoDetailsData = PhotoDetailsData(id: photo.id,
                                                title: photo.title,
                                                imageData: imageData)
        
        presenter.receivePhotoDetails(with: PhotoDetailsData(id: photoDetailsData.id,
                                                             title: photoDetailsData.title,
                                                             imageData: photoDetailsData.imageData))
    }
}

