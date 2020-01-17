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
}

class NewBadgetDataRetriver {
    internal let apiService = APIService()
    private let mapper = NewBadgetMapper()
    
    func getCategories(completion: @escaping ([Category]?) -> ()) {
        apiService.fetchData(endpoint: .categories) { (data) in
            guard let data = data else {
                completion (nil)
                return
            }
            completion(NewBadgetMapper.mapCategories(data: data))
        }
    }
}
