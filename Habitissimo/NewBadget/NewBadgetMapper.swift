//
//  NewBadgetMapper.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 13/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation

class NewBadgetMapper {
    class func mapCategories(data: Data) -> [Category]? {
        return try? JSONDecoder().decode(Array<Category>.self, from: data)
    }
    
    class func mapLocations(data: Data) -> [Location]? {
        var locations = [Location]()
        do {
            locations = try JSONDecoder().decode(Array<Location>.self, from: data)
        } catch {
            print(error)
        }
        return locations
    }
}
