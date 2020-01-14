//
//  BudgetListDataRetriver.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 13/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation

enum Endpoint: String {
    case categories = "category/list"
}
class BudgetListDataRetriver {
    let apiService = APIService()
    
    func getCategories(completion: @escaping ([Category]?) -> ()) {
        apiService.fetchData(endpoint: .categories) { (data) in
            guard let data = data else {
                completion (nil)
                return
            }
            completion(BudgetListMapper.mapCategories(data: data))
        }
    }
}
