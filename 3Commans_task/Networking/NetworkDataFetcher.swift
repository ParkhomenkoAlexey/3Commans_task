//
//  NetworkDataFetcher.swift
//  3Commans_task
//
//  Created by Алексей on 31.10.2022.
//

import Foundation
import SwiftyJSON

protocol DataFetcher {
    func getList(fromPage: Int, completion: @escaping (Result<[FeedObject], Error>) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    
    var networking: Networking
    
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }
    
    func getList(fromPage: Int, completion: @escaping (Result<[FeedObject], Error>) -> Void) {
        let params = [
            "start_from": "\(fromPage)",
            "extras": "url_m",
            "sort": "relevance",
            "method": "\(API.Method.photosList)"
        ]
        networking.request(params: params) { result in
            switch result {
            case .success(let data):
                
                guard let json = try? JSON(data: data) else {
                    return
                }
                let feedJSON = json["photos"]["photo"]
                let feed = feedJSON.arrayValue.flatMap { FeedObject(json: $0) }
                completion(.success(feed))
                print("feed: ", feed)
            case .failure(let error):
                print(error)
                print(error.localizedDescription)
            }
        }
    }
}
