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
    func showInfo()
}

// for presenter
protocol MainViewOutputProtocol {
    init(view: MainViewInputProtocol)
    func didSelectCell()
}

final class MainViewController: UIViewController {
    
    var tableView = UITableView()
    var presenter: MainViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photos"
        configureTableView()
        print("DONE")
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

// MARK: - MainViewInputProtocol
extension MainViewController: MainViewInputProtocol {
    func showInfo() {
        // putting some text to table cells
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        cell.idLabel.text = "\(indexPath.row + 1)."
        cell.titleLabel.text = "gewesdgrerehreshfdsrshrehrsehredrrdrds"
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

