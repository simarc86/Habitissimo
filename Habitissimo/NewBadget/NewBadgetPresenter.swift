//
//  NewBadgetPresenter.swift
//  Habitissimo
//
//  Created Marc Tamarit on 15/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//
//

import UIKit

class NewBadgetPresenter: NewBadgetPresenterProtocol {
    var categories: [Category]? {
        didSet {
            view?.reloadData()
        }
    }

    weak private var view: NewBadgetViewProtocol?
    var interactor: NewBadgetInteractorProtocol?
    private let router: NewBadgetWireframeProtocol

    init(interface: NewBadgetViewProtocol, interactor: NewBadgetInteractorProtocol?, router: NewBadgetWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func viewWillAppear() {
        interactor?.fetchData()
    }
    
    func reloadData(categories: [Category]?) {
        DispatchQueue.main.async {
            self.categories = categories
        }
    }
}
