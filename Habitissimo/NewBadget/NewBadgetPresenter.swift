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
    var presentedCategories: [Category]? {
        didSet {
            DispatchQueue.main.async {
                self.view?.reloadCategories()
            }
        }
    }
    
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
    private var presentingCategories = false
    private var selectedCategory: Category?
    private var selectedSubcategory: Category?
    weak private var view: NewBadgetViewProtocol?
    var interactor: NewBadgetInteractorProtocol?
    private let router: NewBadgetWireframeProtocol

    init(interface: NewBadgetViewProtocol, interactor: NewBadgetInteractorProtocol?, router: NewBadgetWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
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
//        updateComponents(selectedCategory: selectedCategory)
    }
    
    func subcategorySelected(index: Int) {
        guard let selectedSubcategory = subcategories?[index] else {
            return
        }
        self.selectedSubcategory = selectedSubcategory
        hidePicker()
        view?.updateCategoryComponent(text: selectedSubcategory.name)
//        updateComponents(selectedCategory: selectedSubcategory)
    }
    
//    func updateComponents(selectedCategory: Category) {
//        if presentingCategories {
//            view?.updateCategoryComponent(text: selectedCategory.name)
//        }else {
//            view?.updateSubcategoryComponent(text: selectedCategory.name)
//        }
//    }
    
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
}
