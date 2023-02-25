//
//  MenuCell.swift
//  MenuTableView
//
//  Created by 강민수 on 2023/02/25.
//

import UIKit

class MenuCell: UITableViewCell {
    
    static let identifier = "MenuCell"

    @IBOutlet weak var menuLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
