//
//  DetailsViewController.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 27.03.2022.
//

import UIKit

// for view
protocol DetailsViewInputProtocol: AnyObject {
    func displayPhotoTitle(with title: String)
    func displayPhotoId(with title: String)
    func displayPhotoImage(with image: UIImage)
}

// for presenter
protocol DetailsViewOutputProtocol {
    init(view: DetailsViewInputProtocol)
    func showDetails()
}

final class DetailsViewController: UIViewController {
    
    let photoImageView = UIImageView()
    let photoTextView = UITextView()
    let photoIdLabel = UILabel()
    var presenter: DetailsViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        presenter.showDetails()
    }
    
    private func configureUI() {
        
        // view
        view.backgroundColor = .systemBackground
                
        // photoImageView
        let image = UIImage(systemName: "nosign")
        photoImageView.image = image
        photoImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        photoImageView.center = view.center
        photoImageView.contentMode = .scaleAspectFit
        
        // photoTextView
        photoTextView.isEditable = false
        photoTextView.isScrollEnabled = false
        photoTextView.isSelectable = false
        photoTextView.textAlignment = .center
        photoTextView.font = .systemFont(ofSize: 17)
        
        // photoIdLabel
        photoIdLabel.font = .systemFont(ofSize: 30)
        photoIdLabel.textAlignment = .center
        photoIdLabel.sizeToFit()
        
        // subviews adding
        view.addSubview(photoImageView)
        view.addSubview(photoTextView)
        view.addSubview(photoIdLabel)
        
        // constraints
        photoTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            photoTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            photoTextView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 20),
            photoTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        photoIdLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoIdLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoIdLabel.bottomAnchor.constraint(equalTo: photoImageView.topAnchor, constant: -20)
        ])
    }
}

// MARK: - DetailsViewInputProtocol
extension DetailsViewController: DetailsViewInputProtocol {
    func displayPhotoImage(with image: UIImage) {
        // ...
    }
    
    func displayPhotoTitle(with title: String) {
        photoTextView.text = title
    }
    
    func displayPhotoId(with title: String) {
        photoIdLabel.text = title
    }
}
