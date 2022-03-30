//
//  AssemblyBuilder.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 28.03.2022.
//

import UIKit.UIViewController

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailsModule() -> UIViewController
}

final class AssemblyBuilder: Builder {    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view)
        let interactor = MainInteractor(presenter: presenter)
        
        view.presenter = presenter
        presenter.interactor = interactor
        
        return view
    }
    
    static func createDetailsModule() -> UIViewController {
        let photo = Photo(id: 1,
                          title: "wgewshhrekl nkfnawkwf klmj akfa jfklsa kjafka fnlkafklfna ",
                          stringURL: "")
        let view = DetailsViewController()
        let presenter = DetailsPresenter(view: view)
        let interactor = DetailsInteractor(presenter: presenter, photo: photo)
        
        view.presenter = presenter
        presenter.interactor = interactor
        
        return view
    }
}
