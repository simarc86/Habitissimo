//
//  BudgetListMapper.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 13/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation

class BudgetListMapper {
    class func mapCategories(data: Data) -> [Category]? {
        return try? JSONDecoder().decode(Array<Category>.self, from: data)
    }
}
