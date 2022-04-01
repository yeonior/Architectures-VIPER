//
//  MainSectionViewModel.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 31.03.2022.
//

protocol SectionRowPresentable {
    var rows: [CellIdentifiable] { get set }
}

final class MainSectionViewModel: SectionRowPresentable {
    var rows: [CellIdentifiable] = []
}
