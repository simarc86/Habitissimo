//
//  BudgetListDataRetriver.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 13/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation

class BudgetListDataRetriver {
    private let localService = LocalService()
    
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
