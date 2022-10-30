//
//  ListModuleListModulePresenter.swift
//  3Commans_task
//
//  Created by Alexey Parkhomenko on 30/10/2022.
//  Copyright © 2022 Alexey Parkhomenko. All rights reserved.
//

class ListModulePresenter {

    weak var view: ListModuleViewInput!
    var interactor: ListModuleInteractorInput!
    var router: ListModuleRouterInput!
}

// MARK: - ListModuleModuleInput
extension ListModulePresenter: ListModuleModuleInput {
    
}

// MARK: - ListModuleViewOutput
extension ListModulePresenter: ListModuleViewOutput {
    func viewIsReady() {
        view.setupInitialState()
    }
}

// MARK: - ListModuleInteractorOutput
extension ListModulePresenter: ListModuleInteractorOutput {
    
}
