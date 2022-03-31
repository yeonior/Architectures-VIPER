//
//  MainViewController.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 18.02.2022.
//

import UIKit

// for view
protocol MainViewInputProtocol: AnyObject {
    func displayCellIdTitle(with title: String)
}

// for presenter
protocol MainViewOutputProtocol {
    init(view: MainViewInputProtocol)
    func viewDidLoad()
}

final class MainViewController: UIViewController {
    
    private var tableView = UITableView()
    var presenter: MainViewOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        presenter.viewDidLoad()
    }
    
    // MARK: - Private methods
    private func configureUI() {
        
        // view
        title = "Photos"
        
        // tableView
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        // subviews adding
        view.addSubview(tableView)
    }
}

// MARK: - MainViewInputProtocol
extension MainViewController: MainViewInputProtocol {
    func displayCellIdTitle(with title: String) {
        
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainTableViewCell {
//            let idText = String(describing: data?[indexPath.row].id)
            cell.idLabel.text = "\(indexPath.row + 1)."
            cell.titleLabel.text = "accusamus beatae ad facilis cum similique qui sunt"
            
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

