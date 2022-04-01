//
//  MainRouter.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 01.04.2022.
//

protocol MainRouterInputProtocol {
    init(viewController: MainViewController)
    func openDetailsViewController(with: Photo)
}

final class MainRouter: MainRouterInputProtocol {
    
    let viewController: MainViewController
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func openDetailsViewController(with: Photo) {
        
    }
}
