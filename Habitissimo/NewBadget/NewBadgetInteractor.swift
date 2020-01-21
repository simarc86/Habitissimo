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
    
    let retriver = NewBadgetDataRetriver()
    weak var presenter: NewBadgetPresenterProtocol?
        
    func fetchData() {
        fetchCategories()
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
}
