//
//  BudgetListInteractor.swift
//  Habitissimo
//
//  Created Marc Tamarit on 12/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//
//

import UIKit

class BudgetListInteractor: BudgetListInteractorProtocol {
    weak var presenter: BudgetListPresenterProtocol?
    let retriver = BudgetListDataRetriver()
    var categories: [Category]?
    var budgets: [Budget]?{
        didSet {
            presenter?.reloadData(budgets: budgets)
        }
    }
    
    func fetchData() {
        fetchCategories()
        fetchBudgets()
    }
    
//    func saveBudget() {
//        retriver.saveBudget()
//    }
    
    func fetchCategories() {
        retriver.getCategories { (categories) in
            self.categories = categories
        }
    }
    
    func fetchBudgets() {
        retriver.getBudgets { (budgets) in
            self.budgets = budgets
        }
    }
}
