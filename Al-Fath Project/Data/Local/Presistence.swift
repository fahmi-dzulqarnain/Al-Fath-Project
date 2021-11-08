//
//  Presistence.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 08/11/21.
//

import Foundation
import CoreData

struct PersistneceController {
    static let shared = PersistneceController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: Path.db_name)
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError?{
                fatalError("Error: \(error)")
            }
        }
    }
    
    func getById(id: NSManagedObjectID) -> JourneyEntity? {
        do {
            return try container.viewContext.existingObject(with: id) as? JourneyEntity
        } catch {
            return nil
        }
    }
    
    func save(completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    
    func delete(_ object: NSManagedObject, completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        context.delete(object)
        save(completion: completion)
    }
    
}
