//
//  MainPresenter.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 26.02.2022.
//

import Foundation

struct PhotoData {
    let id: Int
    let title: String
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
    func photosDidReceived(_ photosData: [PhotoData]) {
        
        // preparing data
        let section = MainSectionViewModel()
        photosData.forEach { photoData in
            let newElemenet = MainCellViewModel(photoData: photoData)
            section.rows.append(newElemenet)
        }
        
        view.reloadData(for: section)
    }
    
    func photoDidReceive(_ photo: Photo) {
        router.openDetailsViewController(with: photo)
    }
}
