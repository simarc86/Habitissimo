//
//  NewBadgetDataRetriver.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 17/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation

protocol NewBadgetDataRetriverDelegate {
    func success()
    func error()
}

enum Endpoint: String {
    case categories = "category/list"
    case subcategories = "category/list/"
    case locations = "location/list"
}

class NewBadgetDataRetriver {
    private let apiService = APIService()
    private let mapper = NewBadgetMapper()
    private let localService = LocalService()
    var delegate: NewBadgetDataRetriverDelegate?
    
    func getCategories(completion: @escaping ([Category]?) -> ()) {
        apiService.fetchData(endpoint: Endpoint.categories.url()) { (data) in
            guard let data = data else {
                completion (nil)
                return
            }
            completion(NewBadgetMapper.mapCategories(data: data))
        }
    }
    
    func getSubcategories(id: String, completion: @escaping ([Category]?) -> ()) {
        apiService.fetchData(endpoint: Endpoint.subcategories.url(id: id)) { (data) in
            guard let data = data else {
                completion (nil)
                return
            }
            completion(NewBadgetMapper.mapCategories(data: data))
        }
    }
    
    func getLocations(completion: @escaping ([Location]?) -> ()) {
        apiService.fetchData(endpoint: Endpoint.locations.url()) { (data) in
            guard let data = data else {
                completion (nil)
                return
            }
            completion(NewBadgetMapper.mapLocations(data: data))
        }
    }
    
    func saveBudget(
        customDescription: String,
        email: String,
        id: String,
        location: String,
        name: String,
        phone: String) {
        guard let phone = Int64(phone) else {
            return
        }
        let budget = Budget.newBudget(context: localService.context)
        budget.customDescription = customDescription
        budget.email = email
        budget.id = id
        budget.location = location
        budget.name = name
        budget.phone = phone
        
        do {
            try localService.saveData()
            delegate?.success()
        } catch {
            delegate?.error()
        }
    }
}

extension Endpoint {
    func url() -> String {
        return self.rawValue
    }
    
    func url(id: String) -> String {
        return self.rawValue + id
    }
}
