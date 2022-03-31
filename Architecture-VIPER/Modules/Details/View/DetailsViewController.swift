//
//  DetailsViewController.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 27.03.2022.
//

import UIKit

// for view
protocol DetailsViewInputProtocol: AnyObject {
    func displayPhotoId(with title: String)
    func displayPhotoTitle(with title: String)
    func displayPhotoImage(with imageData: Data)
    func displayImageForFavouriteButton(with status: Bool)
}

// for presenter
protocol DetailsViewOutputProtocol {
    init(view: DetailsViewInputProtocol)
    func showDetails()
    func favouriteButtonDidTouch()
}

final class DetailsViewController: UIViewController {
    
    let photoImageView = UIImageView()
    let photoTextView = UITextView()
    let photoIdLabel = UILabel()
    let favouriteButton = UIButton()
    var presenter: DetailsViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        presenter.showDetails()
    }
    
    // MARK: - Private methods
    private func configureUI() {
        
        // view
        view.backgroundColor = .systemBackground
                
        // photoImageView
        let image = UIImage(systemName: "nosign")
        photoImageView.image = image
        photoImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
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
        
        // favouriteButton
        favouriteButton.tintColor = .systemPink
        favouriteButton.addTarget(self, action: #selector(favoriteButtonTouched), for: .touchUpInside)
        
        // subviews adding
        view.addSubview(photoImageView)
        view.addSubview(photoTextView)
        view.addSubview(photoIdLabel)
        view.addSubview(favouriteButton)
        
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
        
        favouriteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favouriteButton.topAnchor.constraint(equalTo: photoImageView.topAnchor, constant: 5),
            favouriteButton.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: -5)
        ])
    }
    
    @objc
    private func favoriteButtonTouched() {
        presenter.favouriteButtonDidTouch()
    }
}

// MARK: - DetailsViewInputProtocol
extension DetailsViewController: DetailsViewInputProtocol {
    func displayPhotoId(with title: String) {
        photoIdLabel.text = title
    }
    
    func displayPhotoTitle(with title: String) {
        photoTextView.text = title
    }
    
    func displayPhotoImage(with imageData: Data) {
        photoImageView.image = UIImage(data: imageData)
    }
    
    func displayImageForFavouriteButton(with status: Bool) {
        var imageName = ""
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .large)
        imageName = status ? "heart.fill" : "heart"
        favouriteButton.setImage(UIImage(systemName: imageName, withConfiguration: imageConfig), for: .normal)
    }
}
