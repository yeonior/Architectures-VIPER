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
    
    let imageView = UIImageView()
    var presenter: DetailsViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI() {
        
        view.backgroundColor = .systemBackground
        
        let image = UIImage(systemName: "nosign")
        imageView.image = image
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
    }
}

// MARK: - DetailsViewInputProtocol
extension DetailsViewController: DetailsViewInputProtocol {
    func someFunc(with: Any) {
        // something
    }
}
