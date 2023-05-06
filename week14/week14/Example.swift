//
//  Example.swift
//  week14
//
//  Created by 강민수 on 2023/04/15.
//

import Foundation
import CoreData

final class Example<T: NSManagedObject> {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Joke")
        
        container.loadPersistentStores { description, error in
            guard error == nil else { fatalError("Coredata Error") }
        }
        
        return container
    }()
    
    func save(data: T, by entityName: String) {
        
    }
    
    func search(request: NSFetchRequest<NSFetchRequestResult>) {
        
    }
    
    func delete(data: T, by entityName: String) {
        
    }
    
    func update(target: String, value: Any) {
    }
}
