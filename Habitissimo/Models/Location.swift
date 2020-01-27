//
//  Location.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 21/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation

class Location: Codable {
    let id: Int
    let parentId: Int
    let name: String
    let zip: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case parentId = "parent_id"
        case zip = "zip"
        case name = "name"
    }
}
