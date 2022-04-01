//
//  MainRouter.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 01.04.2022.
//

protocol MainRouterInputProtocol {
    init(viewController: MainViewController)
    func openDetailsViewController(with photo: Photo)
}

final class MainRouter: MainRouterInputProtocol {
    
    let viewController: MainViewController
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func openDetailsViewController(with photo: Photo) {
        let detailsViewController = AssemblyBuilder.createDetailsModule(with: photo)
        viewController.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
