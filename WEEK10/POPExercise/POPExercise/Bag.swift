//
//  Bag.swift
//  POPExercise
//
//  Created by Rowan on 2023/03/11.
//

protocol Portable { }

struct Bag {
    private var items: [Portable] = []
    
    mutating func put(item: Portable) {
        items.append(item)
    }
    
    func checkBag() {
        items.forEach {
            print($0)
        }
    }
}
