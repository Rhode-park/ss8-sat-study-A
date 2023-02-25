//
//  ViewController.swift
//  MenuTableView
//
//  Created by 강민수 on 2023/02/25.
//

import UIKit

enum FoodType: String, CaseIterable {
    case American = "American"
    case Chinese = "Chinese"
    case Korean = "Korean"
    case Japanese = "Japanese"
}

struct Food {
    let name: String
    var price: Int
}


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let category = FoodType.allCases
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
            Food(name: "스윙스(돈까스)", price: 5000)
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.sectionHeaderTopPadding = 20
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func didTapButton(_ sender: Any) {
        self.present(MenuTableViewController(), animated: true)
    }
    
}

extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        guard let headerView = view as? UITableViewHeaderFooterView else { return }
//        let categorySection = self.category.map { return $0.rawValue }
//
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = categorySection[section]
//        label.textColor = .black
//
//        headerView.contentView.addSubview(label)
//
//        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: headerView.topAnchor),
//            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
//            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor)
//        ])
//
//        self.tableView.tableHeaderView = headerView
//    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let index = category[section]
        
        return self.menu[index]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell,
                let data = self.menu[category[indexPath.section]] else {
            return UITableViewCell()
        }
        
        cell.menuLabel.text = data[indexPath.row].name
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let categorySection = self.category.map { return $0.rawValue }

        return categorySection[section]
    }
    
}
