//
//  AddWordsViewController.swift
//  week14
//
//  Created by 강민수 on 2023/04/15.
//

import UIKit

class AddWordsViewController: UIViewController {
    
    private let dataManager = CoreDataManager.shared
    private var cateogory = "유행어"
    
    var delegate: UpdateDelegate?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sgementedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func createJokeModel() -> JokeModel? {
        guard let content = textField.text,
              let category = JokeModel.Category(rawValue: self.cateogory) else { return nil }
        
        return JokeModel(content: content, category: category, id: UUID())
    }
    
    @IBAction func didTapChangeCategory(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        
        guard let title = sender.titleForSegment(at: index) else { return }
        
        cateogory = title
    }
    
    
    @IBAction func didTapStoreButton(_ sender: UIButton) {
        guard let model = createJokeModel() else { return }
        
        try? dataManager.save(data: model, by: "Joke")
        
        delegate?.reload()
        
        dismiss(animated: true)
    }
}
