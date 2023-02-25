//
//  CustomTableViewCell.swift
//  tableview_workspace
//
//  Created by Jinah Park on 2023/02/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    
    func configure(section: Int, row: Int) {
        menuImageView?.image = UIImage(systemName: "circle")
        menuLabel?.text = menu[FoodType.allCases[section]]?[row].name
    }
}
