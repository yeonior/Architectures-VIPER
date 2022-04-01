//
//  MainCellViewModel.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 31.03.2022.
//

protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
}

final class MainCellViewModel: CellIdentifiable {
    
    let id: Int
    let title: String
    
    var cellIdentifier: String {
        "cell"
    }
    var cellHeight: Double {
        50
    }
    
    init(photoData: PhotoData) {
        id = photoData.id
        title = photoData.title
    }
}
