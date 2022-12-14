//
//  ListModuleListModulePresenter.swift
//  3Commans_task
//
//  Created by Alexey Parkhomenko on 30/10/2022.
//  Copyright © 2022 Alexey Parkhomenko. All rights reserved.
//

import UIKit

class ListModulePresenter {

    weak var view: ListModuleViewInput!
    var interactor: ListModuleInteractorInput!
    var router: ListModuleRouterInput!
    
    private var requestedPage: Int = 0
    var feed: [FeedObject] = []
    
    private func showErrorAlert(error: Error) -> UIAlertController {
        let alertController = UIAlertController(title: "", message: error.localizedDescription, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            
        })
        alertController.addAction(alertAction)
        return alertController
    }
}

// MARK: - ListModuleModuleInput
extension ListModulePresenter: ListModuleModuleInput {
    
}

// MARK: - ListModuleViewOutput
extension ListModulePresenter: ListModuleViewOutput {
    
    func didSelectRowAt(indexPath: IndexPath) {
        let object = feed[indexPath.row]
        router.routeToDetailScreen(feedObject: object)
    }
    
    func heightForCell(indexPath: IndexPath) -> CGFloat {
        let object = feed[indexPath.row]
        let diff: CGFloat = CGFloat(object.height / object.width)
        let height = UIScreen.main.bounds.width * diff
        print(diff, height)
        return height
    }
    
    func fetchList() {
        interactor.fetchList(fromPage: requestedPage)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            self.requestedPage += 1
            interactor.fetchList(fromPage: requestedPage)
        }
    }
}

// MARK: - ListModuleInteractorOutput
extension ListModulePresenter: ListModuleInteractorOutput {
    func fetchListSuccess(feed: [FeedObject]) {
        self.feed.append(contentsOf: feed)
        self.view.reloadTableView()
    }
    
    func fetchListFailure(error: Error) {
        self.view.showAlertController(alertController: self.showErrorAlert(error: error))
    }
}
