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
    func dismiss()
    func updatePreviousViewController()
}
//MARK: Presenter -
protocol NewBadgetPresenterProtocol: class {
    var subcategories: [Category]? { get }
    var categories: [Category]? { get }
    var locations: [Location]? { get }

    func viewWillDisappear()
    func reloadSubcategoriesData(subcategories: [Category]?)
    func reloadCategoriesData(categories: [Category]?)
    func categorySelected(index: Int)
    func subcategorySelected(index: Int)
    func requestCategory()
    func requestSubcategory()
    func requestSave(customDescription: String?,email: String?, id: String?, location: String?, name: String?, phone: String?)
    func budgetSaved()
    func locationSelected(row: Int)
    func locationsFiltered(locations: [Location]?)
    func locationTextInput(text: String)
    func invalidEmail()
    func invalidPhone()
}

//MARK: Interactor -
protocol NewBadgetInteractorProtocol: class {
    var subcategories: [Category]? { get }
    var categories: [Category]? { get }
    var presenter: NewBadgetPresenterProtocol?  { get set }
    
    func fetchCategories()
    func fetchSubcategories(of category: Category)
    func searchText(text: String)
    func saveBudget(customDescription: String, email: String, id: String, location: String, name: String, phone: String)
    func checkPhone(text: String) -> Bool
    func checkEmail(text: String) -> Bool
}

//MARK: View -
protocol NewBadgetViewProtocol: class {
    var presenter: NewBadgetPresenterProtocol?  { get set }
    func reloadCategories()
    func showPicker(value: Bool)
    func reloadLocation()
    func updateCategoryComponent(text: String)
    func updateLocationComponent(text: String)
    func showAlert(title: String, text: String)
}
