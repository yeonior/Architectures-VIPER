//
//  AssemblyBuilder.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 28.03.2022.
//

import UIKit.UIViewController

protocol Builder {
    static func createMainModule() -> UIViewController
}

final class AssemblyBuilder: Builder {    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view)
        let interactor = MainInteractor(presenter: presenter)
        
        presenter.interactor = interactor
        
        return view
    }
}
