//
//  Photo.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 27.03.2022.
//

struct Photo: Decodable {
    let id: Int
    let title: String
    let stringURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case stringURL = "url"
    }
}
