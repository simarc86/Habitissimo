//
//  Budget.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 14/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import UIKit
import CoreData

@objc(Budget)
class Budget: NSManagedObject {

    class func newBudget(context: NSManagedObjectContext) -> Budget{
        guard let entity = NSEntityDescription.entity(forEntityName: "Budget", in: context) else {
            return Budget()
        }
        return Budget(entity: entity, insertInto: context)
    }
}
