//
//  ViewController.swift
//  TableViewExercise
//
//  Created by Rowan on 2023/02/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
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
        tableview.delegate = self
        tableview.dataSource = self
        setTitleLabel()
    }
    
    private func setTitleLabel() {
        self.titleLabel.text = "메뉴판"
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.category.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu[category[section]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "custom", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.leftImage.image = UIImage(systemName: "circlebadge")
        cell.leftImage.tintColor = .systemCyan
        
        let menu = self.menu[category[indexPath.section]]
        cell.rightLabel?.text = menu?[indexPath.row].name

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return category[section].rawValue
    }
}
