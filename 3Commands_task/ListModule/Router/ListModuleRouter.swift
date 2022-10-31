//
//  ListModuleListModuleRouter.swift
//  3Commans_task
//
//  Created by Alexey Parkhomenko on 30/10/2022.
//  Copyright © 2022 Alexey Parkhomenko. All rights reserved.
//

import UIKit

class ListModuleRouter: ListModuleRouterInput {
    
    var viewController: UIViewController!
    
    func routeToDetailScreen(feedObject: FeedObject) {
        let detailVC = DetailInfoViewController()
        detailVC.configureWith(imageString: feedObject.imageURL, name: feedObject.name)
        viewController.navigationController?.pushViewController(detailVC, animated: true)
    }

}
