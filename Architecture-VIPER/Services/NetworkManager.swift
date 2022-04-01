//
//  NetworkManager.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 27.03.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func getPhotos(completion: @escaping (Result<[Photo]?, Error>) -> Void)
    func getData(from stringURL: String) -> Data
}

final class NetworkManager: NetworkManagerProtocol {
    
    static var shared = NetworkManager()
    
    private let sessionConfiguration = URLSessionConfiguration.default
    private let session = URLSession.shared
    private let stringURL = "https://jsonplaceholder.typicode.com/photos"
    
    private init() {}
    
    func getPhotos(completion: @escaping (Result<[Photo]?, Error>) -> Void) {
        guard let url = URL(string: stringURL) else { return }
        
        let dataTask = session.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                do {
                    let photos = try JSONDecoder().decode([Photo].self, from: data)
                    DataManager.shared.setPhotos(photos)
                    DispatchQueue.main.async {
                        completion(.success(photos))
                    }
                } catch {
                    completion(.failure(error))
                }
            } else if let error = error {
                completion(.failure(error))
                return
            }
        }
        
        dataTask.resume()
    }
    
    func getData(from stringURL: String) -> Data {
        guard let url = URL(string: stringURL), let data = try? Data(contentsOf: url) else { return Data()}
        
        return data
    }
}
