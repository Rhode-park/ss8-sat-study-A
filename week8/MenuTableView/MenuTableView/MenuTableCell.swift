//
//  MenuTableCell.swift
//  MenuTableView
//
//  Created by 강민수 on 2023/02/25.
//

import UIKit

class MenuTableCell: UITableViewCell {
    
    static let identifier = "MenuTableCell"
    
    var circleImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(systemName: "circlebadge")
        
        return imageView
    }()
    
    var label = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureImageView()
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureImageView() {
        self.contentView.addSubview(circleImageView)
        
        NSLayoutConstraint.activate([
            circleImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            circleImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            circleImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20)
        ])
    }
    
    func configureLabel() {
        self.contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: circleImageView.centerYAnchor)
        ])
    }
}
