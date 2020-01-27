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
    private var presentingCategories = false
    private var selectedCategory: Category?
    private var selectedSubcategory: Category?
    var locations: [Location]?
    private var description: String?
    private var name: String?
    private var id: String?
    private var location: String?
    private var category: String?
    private var phone: Int64?
    private var email: String?
    
    weak private var view: NewBadgetViewProtocol?
    var interactor: NewBadgetInteractorProtocol?
    private let router: NewBadgetWireframeProtocol
    
    var subcategories: [Category]? {
        didSet {
            DispatchQueue.main.async {
                self.view?.reloadCategories()
            }
        }
    }
    
    var categories: [Category]? {
        didSet {
            DispatchQueue.main.async {
                self.view?.reloadCategories()
            }
        }
    }
    
    private var fetching = false {
        didSet {
            DispatchQueue.main.async {
                self.view?.showPicker(value: !self.fetching)
            }
        }
    }

    init(interface: NewBadgetViewProtocol, interactor: NewBadgetInteractorProtocol?, router: NewBadgetWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func viewWillDisappear() {
        router.updatePreviousViewController()
    }
    
    func reloadCategoriesData(categories: [Category]?) {
        self.fetching = false
        self.categories = categories
    }
    
    func reloadSubcategoriesData(subcategories: [Category]?) {
        self.fetching = false
        self.subcategories = subcategories
    }
   
    func categorySelected(index: Int) {
        guard let selectedCategory = categories?[index] else {
            return
        }
        self.selectedCategory = selectedCategory
        requestSubcategory()
    }
    
    func subcategorySelected(index: Int) {
        guard let selectedSubcategory = subcategories?[index] else {
            return
        }
        self.selectedSubcategory = selectedSubcategory
        category = selectedSubcategory.name
        hidePicker()
        view?.updateCategoryComponent(text: selectedSubcategory.name)
    }
    
    func requestCategory() {
        fetching = true
        presentingCategories = true
        interactor?.fetchCategories()
    }
    
    func requestSubcategory() {
        fetching = true
        presentingCategories = false
        guard let selectedCategory = selectedCategory else {
            return
        }
        interactor?.fetchSubcategories(of: selectedCategory)
    }
    
    func hidePicker() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.view?.showPicker(value: false)
        })
    }
    
    func locationTextInput(text: String) {
        interactor?.searchText(text: text)
    }
    
    func locationsFiltered(locations: [Location]?) {
        self.locations = locations
        view?.reloadLocation()
    }
    
    func locationSelected(row: Int) {
        guard let location = locations?[row] else {
            return
        }
        self.location = location.name
        view?.updateLocationComponent(text: location.name)
    }
    
    func requestSave(
        customDescription: String?,
        email: String?,
        id: String?,
        location: String?,
        name: String?,
        phone: String?) {
        guard let description = customDescription,
            let email = email,
            let id = id,
            let location = location,
            let name = name,
            let phone = phone else {
            return
        }
        if description.isEmpty || email.isEmpty || location.isEmpty || name.isEmpty || phone.isEmpty {
            view?.showAlert(title: "Alert", text: "All fields must be filled")
        } else {
            interactor?.saveBudget(
                customDescription: description,
                email: email,
                id: id,
                location: location,
                name: name,
                phone: phone
            )
        }
    }
    
    func budgetSaved() {
        router.dismiss()
    }
    
    func invalidEmail() {
        view?.showAlert(title: "Error", text: "Invalid email")
    }
    
    func invalidPhone() {
        view?.showAlert(title: "Error", text: "Invalid phone")
    }
    
}
