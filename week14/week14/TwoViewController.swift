//
//  TwoViewController.swift
//  week14
//
//  Created by 강민수 on 2023/04/15.
//

import UIKit

class TwoViewController: UIViewController {

    private var data: [Joke] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        reloadData()
    }
    
    private func reloadData() {
        let dataManager = CoreDataManager.shared
        
        guard let jokesData = try? dataManager.search(by: "Joke", by: .아재개그) else { return }
        
        data = jokesData
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadData()
        tableView.reloadData()
    }
}

extension TwoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        try? CoreDataManager.shared.delete(by: "Joke", to: data[indexPath.row])
        self.data.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

extension TwoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") else { return UITableViewCell() }
        
        cell.textLabel?.text = data[indexPath.row].body
        
        return cell
    }
}
