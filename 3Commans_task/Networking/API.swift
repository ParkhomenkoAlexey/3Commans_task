//
//  API.swift
//  3Commans_task
//
//  Created by Алексей on 31.10.2022.
//

import Foundation

enum API {
    
    static let apiKey = "93c9d23ca5730d844c524da274020c05"
    static let perPageResult =  2
    static let url = "https://www.flickr.com/services/rest/"
    enum Method {
        static let photosList = "flickr.interestingness.getList"
    }
}
