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
            presenter?.reloadData(categories: categories)
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
}
