//
//  ListModuleListModuleInteractor.swift
//  3Commans_task
//
//  Created by Alexey Parkhomenko on 30/10/2022.
//  Copyright © 2022 Alexey Parkhomenko. All rights reserved.
//

class ListModuleInteractor: ListModuleInteractorInput {
    
    let dataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    weak var output: ListModuleInteractorOutput!
    
    func fetchList(fromPage: Int) {
        dataFetcher.getList(fromPage: fromPage) { result in
            switch result {
            case .success(let feed):
                self.output.fetchListSuccess(feed: feed)
            case .failure(let error):
                self.output.fetchListFailure(error: error)
            }
        }
    }

}
