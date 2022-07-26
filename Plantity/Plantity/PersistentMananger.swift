//
//  PersistentMananger.swift
//  Plantity
//
//  Created by 최은형 on 2022/10/06.
//

import Foundation
import CoreData


// 코어데이터 매니저
class PersistenceManager {
    static var shared: PersistenceManager = PersistenceManager()
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Plantity")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
                
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    func fetch<T: NSManagedObject>(request: NSFetchRequest<T>) -> [T] {
        do {
            let fetchResult = try self.context.fetch(request)
            
            return fetchResult
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    // 저장
    func insert(userId: String) -> Bool {
        let entity = NSEntityDescription.entity(forEntityName: "User", in: self.context)
        
        if let entity = entity {
            let managedObj = NSManagedObject(entity: entity, insertInto: self.context)
            
            managedObj.setValue(userId, forKey: "userId")
            
            do {
                try self.context.save()
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        } else {
            return false
        }
    }
    
    // 삭제
    func delete(object: NSManagedObject) -> Bool {
        self.context.delete(object)
        
        do {
            try context.save()
            return true
        } catch {
            return false
        }
        
    }
}
