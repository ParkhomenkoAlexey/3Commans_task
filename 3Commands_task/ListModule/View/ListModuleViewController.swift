//
//  ListModuleListModuleViewController.swift
//  3Commans_task
//
//  Created by Alexey Parkhomenko on 30/10/2022.
//  Copyright © 2022 Alexey Parkhomenko. All rights reserved.
//

import UIKit

class ListModuleViewController: UIViewController {

    var output: ListModuleViewOutput!
    
    let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupElements()
        setupConstraints()
        output.fetchList()
    }
    
    private func setupElements() {
        view.backgroundColor = .red
        
        title = "Flickr's interestingness"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.reuseId)
    }
    
    private func setupConstraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        output.scrollViewDidScroll(scrollView: scrollView)
    }
}

// MARK: - ListModuleModuleInput
extension ListModuleViewController: ListModuleViewInput {
    func showAlertController(alertController: UIAlertController) {
        self.present(alertController, animated: true)
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ListModuleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.reuseId) as! ListCell
        let feedObject = output.feed[indexPath.row]
        cell.configureWith(imageURL: feedObject.imageURL)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
