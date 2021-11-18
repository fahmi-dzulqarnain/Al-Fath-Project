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
    
    func unlockNextLearn(title : String) {
        let context = container.viewContext
        var nextTitleLearn = ""
        
        // Get all data learn
        let request : NSFetchRequest<JourneyEntity> = JourneyEntity.fetchRequest()
        request.sortDescriptors = []
        var learn: [JourneyEntity] = []
        do {
            learn = try context.fetch(request)
        }
        catch {
            print("Error fetching data learn")
        }
        // search index for next learn want to unlock
        for (index, item) in learn.enumerated() {
            if item.title == title {
                nextTitleLearn = learn[safe: index+1]?.title ?? ""
            }
        }
        
        // Do update data isLock for next learn in coredata
        if !nextTitleLearn.isEmpty {
            request.predicate = NSPredicate(format: "title = %@", nextTitleLearn)
        }
        
        do
        {
            let nextLearn = try context.fetch(request)
   
            let objectUpdate = nextLearn[0] as NSManagedObject
                objectUpdate.setValue(false, forKey: "isLock")
                do{
                    try context.save()
                }
                catch
                {
                    print(error)
                }
            }
        catch
        {
            print(error)
        }
    }
}
