//
//  NetworkService.swift
//  3Commans_task
//
//  Created by Алексей on 31.10.2022.
//

import Foundation
import Alamofire

protocol Networking {
    func request(params: [String : String], completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkService: Networking {
    
    func request(params: [String : String], completion: @escaping (Result<Data, Error>) -> Void) {
        let combinedDict = params.merging(defaultParaments()) { $1 }
        AF.request(API.url, method: .get, parameters: combinedDict).validate().responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Functions
    
    private func defaultParaments() -> [String:String] {
        var parameters = [String:String]()
        parameters["api_key"] = API.apiKey
        parameters["per_page"] = "\(API.perPageResult)"
        parameters["format"] = "json"
        parameters["nojsoncallback"] = "1"
        return parameters
    }
}
