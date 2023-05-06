//
//  ViewController.swift
//  week14
//
//  Created by 강민수 on 2023/04/15.
//

import UIKit

class ViewController: UIViewController {

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
        
        guard let jokesData = try? dataManager.search(by: "Joke", by: .유행어) else { return }
        
        data = jokesData
    }

    @IBAction func didTapAddWordsButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AddWordsViewController") as? AddWordsViewController else { return }
        
        vc.delegate = self
        
        present(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        try? CoreDataManager.shared.delete(by: "Joke", to: data[indexPath.row])
        self.data.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }
        
        cell.textLabel?.text = data[indexPath.row].body
        
        return cell
    }
}

extension ViewController: UpdateDelegate {
    func reload() {
        reloadData()
        tableView.reloadData()
    }
}
