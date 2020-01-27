//
//  NewBadgetRouter.swift
//  Habitissimo
//
//  Created Marc Tamarit on 15/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//
//

import UIKit

class NewBadgetRouter: NewBadgetWireframeProtocol {
    static let xibName = "NewBadgetViewController"
    weak var viewController: UIViewController?
    weak var previousViewController: UIViewController?
    
    static func createModule(previousViewController: UIViewController?) -> UIViewController {
        let view = NewBadgetViewController(nibName: xibName, bundle: nil)
        let interactor = NewBadgetInteractor()
        let router = NewBadgetRouter()
        let presenter = NewBadgetPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        router.previousViewController = previousViewController
        
        return view
    }
    
    func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    func updatePreviousViewController() {
        previousViewController?.viewWillAppear(true)
    }
}
