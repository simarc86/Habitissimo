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
    var presentedCategories: [Category]? { get }
    var subcategories: [Category]? { get }
    var categories: [Category]? { get }

    func reloadSubcategoriesData(subcategories: [Category]?)
    func reloadCategoriesData(categories: [Category]?)
    func categorySelected(index: Int)
    func subcategorySelected(index: Int)
    func requestCategory()
    func requestSubcategory()
}

//MARK: Interactor -
protocol NewBadgetInteractorProtocol: class {
    var subcategories: [Category]? { get }
    var categories: [Category]? { get }
    var presenter: NewBadgetPresenterProtocol?  { get set }
    
    func fetchCategories()
    func fetchSubcategories(of category: Category)
}

//MARK: View -
protocol NewBadgetViewProtocol: class {
    var presenter: NewBadgetPresenterProtocol?  { get set }
    func reloadCategories()
    func showPicker(value: Bool)
    func updateCategoryComponent(text: String)
}
