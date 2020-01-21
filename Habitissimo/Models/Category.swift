//
//  Budget.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 13/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation

 class Category: Codable {
    let id: String
    let description: String?
    let subcategory: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case description = "description"
        case subcategory = "child_count"
        case name = "name"
    }
}
