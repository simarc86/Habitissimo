//
//  LocalService.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 13/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation
import CoreData

class LocalService {
    func getData() -> Any {
        return "LOCAL DATA"
    }
    
    func saveData() {
        let budget = Budget(entity: <#T##NSEntityDescription#>, insertInto: <#T##NSManagedObjectContext?#>)
    }
}
