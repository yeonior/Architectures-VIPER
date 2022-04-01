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
        interactor.fetchPhotos()
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
}
