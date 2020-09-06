//
//  Trending.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 4.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import Foundation

struct Trending: Codable {
    let id, serviceID: Int
    let name, longName: String
    let imageURL: String
    let proCount: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case serviceID = "service_id"
        case name = "name"
        case longName = "long_name"
        case imageURL = "image_url"
        case proCount = "pro_count"
    }
}



