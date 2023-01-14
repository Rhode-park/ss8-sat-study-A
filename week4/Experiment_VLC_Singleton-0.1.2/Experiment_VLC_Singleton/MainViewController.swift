//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    var point: Int = 50
//    static let shared = PointManager(point: 100)
    
    init(point: Int) {
        self.point = point
    }
}

protocol Delegate {
    func buy(_ price: Int)
}

final class MainViewController: UIViewController {
    
    let pointManager = PointManager(point: 100)
//    let pointManager = PointManager.shared
    var point: Int {
        get {
            return pointManager.point
        }
        set {
            pointManager.point -= newValue
            updateLabel()
        }
    }
    
    @IBOutlet private weak var pointLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    private func updateLabel() {
        self.pointLabel.text = "\(self.point)"
    }
    
    @IBAction private func didTapRefreshButton(_ sender: UIButton) {
        updateLabel()
    }
    
    @IBAction func didTapMoveToPage(_ sender: UIButton) {
        guard let buyViewController = self.storyboard?.instantiateViewController(withIdentifier: "BuyingViewController") as? BuyingViewController else { return }
        
        buyViewController.delegate = self
        
        present(buyViewController, animated: true)
    }
}

extension MainViewController: Delegate {
    func buy(_ price: Int) {
        self.point = price
    }
}

