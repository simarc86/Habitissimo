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

}
//MARK: Presenter -
protocol BudgetListPresenterProtocol: class {

}

//MARK: Interactor -
protocol BudgetListInteractorProtocol: class {

  var presenter: BudgetListPresenterProtocol?  { get set }
}

//MARK: View -
protocol BudgetListViewProtocol: class {

  var presenter: BudgetListPresenterProtocol?  { get set }
}
