//
//  Portable.swift
//  POPExercise
//
//  Created by Jinah Park on 2023/03/12.
//

protocol Portable {
    var name: String { get }
}

struct Bag {
    private var items: [Portable] = [] {
        didSet {
            print("가방에 \(items.last?.name ?? "물건")을/를 넣었습니다.")
        }
    }
    
    mutating func put(item: Portable...) {
        item.forEach { item in
            items.append(item)
        }
    }
}
