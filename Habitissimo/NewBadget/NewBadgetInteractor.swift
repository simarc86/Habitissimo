//
//  NewBadgetInteractor.swift
//  Habitissimo
//
//  Created Marc Tamarit on 15/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//
//

import UIKit

class NewBadgetInteractor: NewBadgetInteractorProtocol {
    let retriver = NewBadgetDataRetriver()
    var autocompleteService: AutocompleteService?
    weak var presenter: NewBadgetPresenterProtocol?
    var categories: [Category]? {
        didSet {
            presenter?.reloadCategoriesData(categories: categories)
        }
    }
       
    var subcategories: [Category]? {
       didSet {
            presenter?.reloadSubcategoriesData(subcategories: subcategories)
       }
    }
        
    init() {
        retriver.delegate = self
        fetchLocations()
    }
    func fetchCategories() {
        retriver.getCategories { (categories) in
            self.categories = categories
        }
    }
    
    func fetchSubcategories(of category: Category) {
        retriver.getSubcategories(id: category.id) { (subcategories) in
            self.subcategories = subcategories
        }
    }
    
    func fetchLocations() {
        retriver.getLocations { (locations) in
            guard let source = locations else {
                return
            }
            self.autocompleteService = AutocompleteService(source: source)
        }
    }
    
    func searchText(text: String) {
        let locations = autocompleteService?.search(text: text)
        self.presenter?.locationsFiltered(locations: locations)
    }
    
    func saveBudget(customDescription: String,
                    email: String,
                    id: String,
                    location: String,
                    name: String,
                    phone: String) {
        if !checkEmail(text: email) {
            presenter?.invalidEmail()
            return
        }
        
        if !checkPhone(text: phone) {
            presenter?.invalidPhone()
            return
        }
        
        retriver.saveBudget(
            customDescription: customDescription,
            email: email,
            id: id,
            location: location,
            name: name,
            phone: phone)
    }
    
    func checkEmail(text: String) -> Bool {
        return CheckService.isEmailFormat(text: text)
    }
    
    func checkPhone(text: String) -> Bool {
        return CheckService.isPhoneFormat(text: text)
    }
}

extension NewBadgetInteractor: NewBadgetDataRetriverDelegate {
    func success() {
        presenter?.budgetSaved()
    }
    
    func error() {
//        presenter?.
    }
}
