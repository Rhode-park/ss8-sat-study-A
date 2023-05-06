//
//  Joke+CoreDataProperties.swift
//  CoreData
//
//  Created by Jinah Park on 2023/04/15.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var joke: String?

}

extension Joke : Identifiable {

}
