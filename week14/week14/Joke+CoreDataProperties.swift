//
//  Joke+CoreDataProperties.swift
//  week14
//
//  Created by 강민수 on 2023/04/15.
//
//

import Foundation
import CoreData


extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var body: String?
    @NSManaged public var category: String?
    @NSManaged public var id: UUID?

}

extension Joke : Identifiable {

}
