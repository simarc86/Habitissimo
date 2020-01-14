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
    var categories: [Category]? {
        didSet {
            presenter?.categories(budgets: categories)
        }
    }
    
    func fetchData() {
        retriver.getCategories { (categories) in
            self.categories = categories
        }
    }
}
