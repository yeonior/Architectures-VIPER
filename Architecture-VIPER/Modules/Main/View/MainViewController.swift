//
//  MainViewController.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 18.02.2022.
//

import UIKit

// MARK: - Protocols
// for view
protocol MainViewInputProtocol: AnyObject {
    func showInfo(from data: [Photo])
}

// for presenter
protocol MainViewOutputProtocol {
    init(view: MainViewInputProtocol)
    func didLaunchView()
}

final class MainViewController: UIViewController {
    
    var presenter: MainViewOutputProtocol!
    var tableView = UITableView()
    var data: [Photo]?
//    {
//        didSet {
//            showInfo(from: data)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photos"
        configureTableView()
//        showInfo(from: data)
    }
    
    // MARK: - Private methods
    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
    }
}

// MARK: - Extensions
// MARK: - MainViewInputProtocol
extension MainViewController: MainViewInputProtocol {
    func showInfo(from data: [Photo]) {
//        DispatchQueue.main.async {
//            self.presenter.didLaunchView()
//            self.data = data
//            self.tableView.reloadData()
//        }
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.count ?? 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainTableViewCell {
//            let idText = String(describing: data?[indexPath.row].id)
            cell.idLabel.text = "\(indexPath.row + 1)"
            cell.titleLabel.text = data?[indexPath.row].title
            
            return cell
        }
        
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

