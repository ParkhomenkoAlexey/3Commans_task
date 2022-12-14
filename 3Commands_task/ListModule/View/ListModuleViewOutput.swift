//
//  ListModuleListModuleViewOutput.swift
//  3Commans_task
//
//  Created by Alexey Parkhomenko on 30/10/2022.
//  Copyright © 2022 Alexey Parkhomenko. All rights reserved.
//

import UIKit

protocol ListModuleViewOutput {

    func fetchList()
    func heightForCell(indexPath: IndexPath) -> CGFloat
    func didSelectRowAt(indexPath: IndexPath)
    func scrollViewDidScroll(scrollView: UIScrollView)
    var feed: [FeedObject] { get }
}
