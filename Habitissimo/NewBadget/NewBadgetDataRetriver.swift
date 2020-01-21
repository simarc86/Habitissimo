//
//  NewBadgetDataRetriver.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 17/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation

enum Endpoint: String {
    case categories = "category/list"
    case subcategories = "category/list/"
}

class NewBadgetDataRetriver {
    private let apiService = APIService()
    private let mapper = NewBadgetMapper()
    
    
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
}

extension Endpoint {
    func url() -> String {
        return self.rawValue
    }
    
    func url(id: String) -> String {
        return self.rawValue + id
    }
}
