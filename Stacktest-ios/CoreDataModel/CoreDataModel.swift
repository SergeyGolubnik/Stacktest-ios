//
//  CoreDataModel.swift
//  Stacktest-ios
//
//  Created by СОВА on 20.06.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
   
    
    func getAllCategory() -> [ModelCategoryCore] {
        
        let request: NSFetchRequest<ModelCategoryCore> = ModelCategoryCore.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    func getAllTest() -> [ModelTestCore] {
        
        let request: NSFetchRequest<ModelTestCore> = ModelTestCore.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "CoreDataBdPdd")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
    
}
