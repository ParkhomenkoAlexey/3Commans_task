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
        output.viewIsReady()
    
        setupElements()
        setupConstraints()
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
}

// MARK: - ListModuleModuleInput
extension ListModuleViewController: ListModuleViewInput {
    func setupInitialState() {
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ListModuleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.reuseId) as! ListCell
        return cell
    }
}
