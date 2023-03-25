//
//  CollectionViewCell.swift
//  collection
//
//  Created by 강민수 on 2023/03/25.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
   
    @IBOutlet var emojiLabel: UILabel!
    
    override func prepareForReuse() {
        self.emojiLabel.text = ""
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.backgroundColor = .yellow
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
