//
//  ViewController.swift
//  information_workspace
//
//  Created by Jinah Park on 2023/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var informationTableView: UITableView!
    lazy var informationData: [InformationModel] = decodeJSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let informationData: [InformationModel] = decodeJSON()
        print(informationData)
    }
    
    func decodeJSON() -> [InformationModel] {
        let decoder = JSONDecoder()
        guard let informationAsset = NSDataAsset(name: "information") else { return [] }
        do {
            let decodedInformation = try decoder.decode([InformationModel].self, from: informationAsset.data)
            return decodedInformation
        } catch {
            Swift.print(error.localizedDescription)
            return([])
        }
    }
}
