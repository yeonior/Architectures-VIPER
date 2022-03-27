//
//  MainViewController.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 18.02.2022.
//

import UIKit

// for view
protocol MainViewInputProtocol: AnyObject {
    func showInfo()
}

// for presenter
protocol MainViewOutputProtocol {
    init(view: MainViewInputProtocol)
    func didSelectCell()
}

final class MainViewController: UIViewController {
    
    // need some views
    var presenter: MainViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - MainViewInputProtocol
extension MainViewController: MainViewInputProtocol {
    func showInfo() {
        // putting some text to table cells
    }
}

