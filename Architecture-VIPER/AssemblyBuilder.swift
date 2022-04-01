//
//  AssemblyBuilder.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 28.03.2022.
//

import UIKit.UIViewController

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailsModule(with photo: Photo) -> UIViewController
}

final class AssemblyBuilder: Builder {    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(viewController: view)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
    
    static func createDetailsModule(with photo: Photo) -> UIViewController {
        let view = DetailsViewController()
        let presenter = DetailsPresenter(view: view)
        let interactor = DetailsInteractor(presenter: presenter, photo: photo)
        
        view.presenter = presenter
        presenter.interactor = interactor
        
        return view
    }
}
