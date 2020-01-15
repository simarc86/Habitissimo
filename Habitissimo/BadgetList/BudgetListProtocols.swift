//
//  BudgetListProtocols.swift
//  Habitissimo
//
//  Created Marc Tamarit on 12/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//
//

import Foundation

//MARK: Wireframe -
protocol BudgetListWireframeProtocol: class {
    func showNewBudget()
}
//MARK: Presenter -
protocol BudgetListPresenterProtocol: class {
    var categories: [Category]? { get }
    var budgets: [Budget]? { get }
    func viewWillAppear()
    func reloadData(budgets: [Budget]?)
    func addTapped()
}

//MARK: Interactor -
protocol BudgetListInteractorProtocol: class {
    var categories: [Category]? { get }
    var budgets: [Budget]? { get }

    var presenter: BudgetListPresenterProtocol?  { get set }
    
    func fetchData()
}

//MARK: View -
protocol BudgetListViewProtocol: class {

    var presenter: BudgetListPresenterProtocol?  { get set }
    
    func reloadData()
}
