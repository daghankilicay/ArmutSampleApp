//
//  Post.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 5.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import Foundation

struct Post: Codable {
    let title, category: String
    let imageURL: String
    let link: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case category = "category"
        case imageURL = "image_url"
        case link = "link"
    }
}
