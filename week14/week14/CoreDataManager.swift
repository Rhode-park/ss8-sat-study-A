//
//  CoreDataManager.swift
//  week14
//
//  Created by 강민수 on 2023/04/15.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() { }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Joke")
        
        container.loadPersistentStores { description, error in
            guard error == nil else { fatalError("Coredata Error") }
        }
        
        return container
    }()
    
    func save(data: JokeModel, by entityName: String) throws {
        let context = persistentContainer.viewContext
        
        let joke = Joke(context: context)
        
        joke.id = data.id
        joke.body = data.content
        joke.category = data.category.rawValue
        
        do {
            try context.save()
        } catch {
            throw error
        }
    }
    
    func search(by entityName: String, by category: JokeModel.Category) throws -> [Joke] {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        request.predicate = NSPredicate(format: "category == %@", category.rawValue)
        
        do {
            guard let jokes = try context.fetch(request) as? [Joke] else { return [] }
            return jokes
        } catch {
            throw error
        }
    }
    
    func delete(by entityName: String, to model: Joke) throws {
        guard let id = model.id else { return }
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        request.predicate = NSPredicate(format: "id == %@", id.uuidString)
        
        do {
            guard let joke = try context.fetch(request) as? [Joke] else { return }
            
            let deletedObject = joke[0] as NSManagedObject
            
            context.delete(deletedObject)
            
            try context.save()
        } catch {
            throw error
        }
    }
}
