//
//  LocalService.swift
//  Habitissimo
//
//  Created by Marc Tamarit on 13/01/2020.
//  Copyright © 2020 marc. All rights reserved.
//

import Foundation
import CoreData

enum Entity: String {
    case budget = "Budget"
}

class LocalService {
    let modelName = "Habitissimo"
    public let context: NSManagedObjectContext
    let persistentContainer: NSPersistentContainer
    
    public init() {
        persistentContainer = NSPersistentContainer(name: modelName)
        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error {
                assertionFailure(error.localizedDescription)
            }
        }
        context = persistentContainer.viewContext
    }
    
    func fetchData(entity: Entity, completion: @escaping (NSFetchRequest<NSFetchRequestResult>?) -> Void) {
        let itemsFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity.rawValue)
        completion(itemsFetchRequest)
    }
    
    func getData() -> [Budget] {
        let itemsFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Budget")
        let fetchedItems = try! context.fetch(itemsFetchRequest) as! [Budget]
        print("Fetched items: \(fetchedItems)")
        return fetchedItems
    }
    
    func saveData() throws {
        try context.save()
    }
}
