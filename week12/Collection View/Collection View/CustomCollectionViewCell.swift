//
//  CustomCollectionViewCell.swift
//  Collection View
//
//  Created by Jinah Park on 2023/03/25.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    
    func configure(EmojiText: String) {
        backgroundColor = .yellow
        textLabel.text = EmojiText
        textLabel.font = UIFont.preferredFont(forTextStyle: .title1)
    }
}
