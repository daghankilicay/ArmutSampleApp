//
//  MainResponseTest.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 5.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import Foundation

struct MainResponse: Codable {
    let trending, other: [Trending]
    let posts: [Post]
    
    enum CodingKeys: String, CodingKey {
        case trending = "trending"
        case other = "other"
        case posts = "posts"
    }
}


