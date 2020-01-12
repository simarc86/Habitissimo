//
//  BudgetListPresenter.swift
//  Habitissimo
//
//  Created Marc Tamarit on 12/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//
//

import UIKit

class BudgetListPresenter: BudgetListPresenterProtocol {

    weak private var view: BudgetListViewProtocol?
    var interactor: BudgetListInteractorProtocol?
    private let router: BudgetListWireframeProtocol

    init(interface: BudgetListViewProtocol, interactor: BudgetListInteractorProtocol?, router: BudgetListWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
