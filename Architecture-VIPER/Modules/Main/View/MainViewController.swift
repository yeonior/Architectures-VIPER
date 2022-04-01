//
//  MainViewController.swift
//  Architecture-VIPER
//
//  Created by Ruslan on 18.02.2022.
//

import UIKit

// for view
protocol MainViewInputProtocol: AnyObject {
    func reloadData(for section: MainSectionViewModel)
}

// for presenter
protocol MainViewOutputProtocol {
    init(view: MainViewInputProtocol)
    func viewDidLoad()
    func cellDidSelected(at indexPath: IndexPath)
}

final class MainViewController: UIViewController {
    
    private var tableView = UITableView()
    var presenter: MainViewOutputProtocol!
    var section: SectionRowPresentable = MainSectionViewModel()
    
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
    func reloadData(for section: MainSectionViewModel) {
        self.section = section
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel = section.rows[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath) as? MainTableViewCell {
            
            cell.viewModel = viewModel
            
            return cell
        }
        
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(section.rows[indexPath.row].cellHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.cellDidSelected(at: indexPath)
    }
}

