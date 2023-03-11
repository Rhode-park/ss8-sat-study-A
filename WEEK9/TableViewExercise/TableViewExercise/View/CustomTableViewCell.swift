//
//  CustomTableViewCell.swift
//  TableViewExercise
//
//  Created by Rowan on 2023/02/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        
    }

}
