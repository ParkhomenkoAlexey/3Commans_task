//
//  FeedObject.swift
//  3Commans_task
//
//  Created by Алексей on 31.10.2022.
//

import SwiftyJSON

struct FeedObject: Decodable {
    var imageURL: String
    var width: Int
    var height: Int
    var name: String
    
    init?(json: JSON) {
        guard let urlM = json["url_m"].string,
              let width = json["width_m"].int,
              let height = json["height_m"].int,
              let name = json["title"].string else {
            return nil
        }
        self.imageURL = urlM
        self.width = width
        self.height = height
        self.name = name
    }
}
