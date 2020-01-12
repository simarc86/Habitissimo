//
//  BudgetListRouter.swift
//  Habitissimo
//
//  Created Marc Tamarit on 12/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//
//

import UIKit

class BudgetListRouter: BudgetListWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = BudgetListViewController(nibName: "BudgetListViewController", bundle: nil)
        let interactor = BudgetListInteractor()
        let router = BudgetListRouter()
        let presenter = BudgetListPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
