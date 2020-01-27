//
//  AutocompleteService.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 21/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation

class AutocompleteService {
    private let source: [Location]
    init(source: [Location]) {
        self.source = source
    }
    
    func search(text: String) -> [Location] {
        return source.filter{$0.name.starts(with: text)}
    }
}
