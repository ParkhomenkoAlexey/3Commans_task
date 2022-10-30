//
//  ListModuleListModuleConfigurator.swift
//  3Commans_task
//
//  Created by Alexey Parkhomenko on 30/10/2022.
//  Copyright © 2022 Alexey Parkhomenko. All rights reserved.
//
import UIKit

class ListModuleModuleConfigurator: NSObject {

        func makeListModuleViewController() -> ListModuleViewController {
        
        let router = ListModuleRouter()
        let viewController = ListModuleViewController()
        let interactor = ListModuleInteractor()

        let presenter = ListModulePresenter()
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        
        router.viewController = viewController
        
        return viewController
    }
}
