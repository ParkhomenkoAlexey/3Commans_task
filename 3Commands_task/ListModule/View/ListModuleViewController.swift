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

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        view.backgroundColor = .red
    }
}

// MARK: - ListModuleModuleInput
extension ListModuleViewController: ListModuleViewInput {
    func setupInitialState() {
    }
}
