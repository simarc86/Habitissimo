//
//  APIService.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 13/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation

class APIService {
    let baseUrl = "https://api.habitissimo.es/"
    func fetchData(endpoint: String, completion: @escaping (Data?) -> Void) {
        let urlString = baseUrl + endpoint
        if let url = URL(string:urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                completion(data)
            }.resume()
        }
    }
}
