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
    var categories: [Category]? { get }
    
    func viewWillAppear()
    func reloadData(categories: [Category]?)
}

//MARK: Interactor -
protocol NewBadgetInteractorProtocol: class {
    var categories: [Category]? { get }
    var presenter: NewBadgetPresenterProtocol?  { get set }
    
    func fetchData()
}

//MARK: View -
protocol NewBadgetViewProtocol: class {
    var presenter: NewBadgetPresenterProtocol?  { get set }
    func reloadData()
}
