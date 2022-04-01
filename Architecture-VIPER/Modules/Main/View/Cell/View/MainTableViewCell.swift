//
//  MainTableViewCell.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 27.03.2022.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: CellIdentifiable? { get set }
}

final class MainTableViewCell: UITableViewCell, CellModelRepresentable {
    
    // MARK: - Properties
    var viewModel: CellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    let idLabel: UILabel = {
        $0.font = .systemFont(ofSize: 17)
        $0.textAlignment = .center
        $0.clipsToBounds = true
        
        return $0
    }(UILabel())
    
    let titleLabel: UILabel = {
        $0.font = .systemFont(ofSize: 17)
        $0.textAlignment = .left
        $0.clipsToBounds = true
        
        return $0
    }(UILabel())
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configureCell() {
        
        // subviews adding
        contentView.addSubview(idLabel)
        contentView.addSubview(titleLabel)
        
        // constraints
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            idLabel.widthAnchor.constraint(equalTo: idLabel.heightAnchor),
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            idLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    private func updateViews() {
        guard let cellViewModel = viewModel as? MainCellViewModel else { return }
        idLabel.text = String(cellViewModel.id)
        titleLabel.text = cellViewModel.title
    }
}
