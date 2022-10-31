//
//  ListModuleListModuleViewInput.swift
//  3Commans_task
//
//  Created by Alexey Parkhomenko on 30/10/2022.
//  Copyright © 2022 Alexey Parkhomenko. All rights reserved.
//

import UIKit

protocol ListModuleViewInput: class {
    
    func showAlertController(alertController: UIAlertController)
    func reloadTableView()
}
