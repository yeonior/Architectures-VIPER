//
//  DetailsViewController.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 27.03.2022.
//

import UIKit

// for view
protocol DetailsViewInputProtocol: AnyObject {
    func someFunc(with: Any)
}

// for presenter
protocol DetailsViewOutputProtocol {
    init(view: DetailsViewInputProtocol)
}

final class DetailsViewController: UIViewController {
    
    // need some views
    var presenter: DetailsViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - DetailsViewInputProtocol
extension DetailsViewController: DetailsViewInputProtocol {
    func someFunc(with: Any) {
        // something
    }
}
