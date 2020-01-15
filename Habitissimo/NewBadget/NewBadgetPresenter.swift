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

    weak private var view: NewBadgetViewProtocol?
    var interactor: NewBadgetInteractorProtocol?
    private let router: NewBadgetWireframeProtocol

    init(interface: NewBadgetViewProtocol, interactor: NewBadgetInteractorProtocol?, router: NewBadgetWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
