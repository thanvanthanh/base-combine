//
//  SearchModel.swift
//  base-combine
//
//  Created by Thân Văn Thanh on 29/08/2023.
//

import Foundation

class ItemSearchResponse: Codable {
    var totalCount: Int?
    var items: [SearchModel]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
    
}

struct SearchModel: Codable, Identifiable {
    let id: Int
    let avatarUrl: String
    let htmlUrl: URL
    let login: String
    
    enum CodingKeys: String, CodingKey {
        case id, login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
    }
}

