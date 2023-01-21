//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {
    var point: Int = 160
    
    static let shared = PointManager()
    private init() {}
}

class MainViewController: UIViewController {
    
    let pointManager = PointManager.shared
    
    @IBOutlet weak var pointLabel: UILabel!
    
    @IBOutlet weak var buyingButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    
    override func loadView() {
        super.loadView()
        print("1: loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayPoint()
        print("1: viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("1: vieWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("1: viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("1: viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("1: viewDidDisappear")
    }
    
    @IBAction func tapBuyingButton(_ sender: UIButton) {
        presentModal()
    }
    
    func presentModal() {
        guard let buyingViewController = self.storyboard?.instantiateViewController(withIdentifier: "buyingViewController") else {
            return
        }
        buyingViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(buyingViewController, animated: true, completion: nil)
    }
    
    @IBAction func tapUpdateButton(_ sender: UIButton) {
        displayPoint()
    }
    
    func displayPoint() {
        pointLabel.text = String(pointManager.point)
    }
    
}

