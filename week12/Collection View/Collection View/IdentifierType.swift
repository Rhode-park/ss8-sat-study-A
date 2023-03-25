//
//  IdentifierType.swift
//  Collection View
//
//  Created by Jinah Park on 2023/03/25.
//

import UIKit

protocol IdentifierType {
    static var identifier: String { get }
}

extension IdentifierType {
    static var identifier: String {
        return String(describing: self)
    }
}

extension CustomCollectionViewCell: IdentifierType { }
