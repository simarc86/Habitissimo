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
    private let apiService = APIService()
    private let localService = LocalService()
    private let mapper = BudgetListMapper()
    
    func getCategories(completion: @escaping ([Category]?) -> ()) {
        apiService.fetchData(endpoint: .categories) { (data) in
            guard let data = data else {
                completion (nil)
                return
            }
            completion(BudgetListMapper.mapCategories(data: data))
        }
    }
    
    func saveBudget(budget: Budget) {
        localService.saveData(budget: budget)
    }
    
    func getBudgets(completion: @escaping ([Budget]?) -> ()) {
        localService.fetchData(entity: .budget) { (data) in
            guard let data = data,
                let budgets = try? self.localService.context.fetch(data) as? [Budget] else {
                completion (nil)
                return
            }
            completion (budgets)
        }
    }
}
