//
//  NewBadgetProtocols.swift
//  Habitissimo
//
//  Created Marc Tamarit on 15/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//
//

import Foundation

//MARK: Wireframe -
protocol NewBadgetWireframeProtocol: class {

}
//MARK: Presenter -
protocol NewBadgetPresenterProtocol: class {

}

//MARK: Interactor -
protocol NewBadgetInteractorProtocol: class {

  var presenter: NewBadgetPresenterProtocol?  { get set }
}

//MARK: View -
protocol NewBadgetViewProtocol: class {

  var presenter: NewBadgetPresenterProtocol?  { get set }
}
