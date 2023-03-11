//
//  MenuTableViewController.swift
//  MenuTableView
//
//  Created by 강민수 on 2023/02/25.
//

import UIKit

class MenuTableViewController: UIViewController {
    
    let category = FoodType.allCases
    
    var tableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .insetGrouped)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    var titleLabel = UILabel()
    
    var menu: [FoodType: [Food]] = [
        .American: [
            Food(name: "햄버거", price: 5000),
            Food(name: "피자", price: 18000),
            Food(name: "아메리카노", price: 41000)
        ],
        .Chinese: [
            Food(name: "탕수육", price: 18000)
        ],
        .Korean: [
            Food(name: "비빔밥", price: 8000),
            Food(name: "돼지갈비", price: 20000)
        ],
        .Japanese: [
            Food(name: "스시", price: 20000),
            Food(name: "나베", price: 5000)
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tableView.dataSource = self
        
        tableView.register(MenuTableCell.self, forCellReuseIdentifier: MenuTableCell.identifier)

        configureViews()
    }
}

// MARK: - DataSource
extension MenuTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let index = category[section]
        
        return self.menu[index]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableCell.identifier, for: indexPath) as? MenuTableCell,
                let data = self.menu[category[indexPath.section]] else {
            return UITableViewCell()
        }
        
        cell.label.text = data[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let categorySection = self.category.map { return $0.rawValue }
        
        return categorySection[section]
    }
}

// MARK: - View
extension MenuTableViewController {
    func configureViews() {
        configureTitleLabel()
        configureTableView()
    }
    
    func configureTitleLabel() {
        let titleLabel = UILabel()
        self.view.addSubview(titleLabel)
        
        self.titleLabel = titleLabel
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "메뉴판"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    func configureTableView() {
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
