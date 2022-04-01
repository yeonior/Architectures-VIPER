//
//  MainPresenter.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 26.02.2022.
//

import Foundation

struct PhotoData {
    // ...
}

final class MainPresenter: MainViewOutputProtocol {
    
    unowned let view: MainViewInputProtocol
    var interactor: MainInteractorInputProtocol!
    var router: MainRouterInputProtocol!
    
    init(view: MainViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchPhotos()
    }
    
    func cellDidSelected(at indexPath: IndexPath) {
        interactor.providePhoto(at: indexPath)
    }
}

// MARK: - MainInteractorOutputProtocol
extension MainPresenter: MainInteractorOutputProtocol {
    func photosDidReceived(_ photos: [Photo]) {
        // preparing data
        let section = MainSectionViewModel()
        photos.forEach { photo in
            let newElemenet = MainCellViewModel(photo: photo)
            section.rows.append(newElemenet)
        }
        view.reloadData(for: section)
    }
    
    func photoDidReceive(_ photo: Photo) {
        router.openDetailsViewController(with: photo)
    }
}
