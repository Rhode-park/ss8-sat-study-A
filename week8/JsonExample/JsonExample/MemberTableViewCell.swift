//
//  MemberTableViewCell.swift
//  JsonExample
//
//  Created by 강민수 on 2023/02/25.
//

import UIKit

class MemberTableViewCell: UITableViewCell {
    
    static let identifier = "MemberTableViewCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ssLabel: UILabel!
    @IBOutlet weak var phoeInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
