//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class PointManager {

    var point: Int = 50
}

class MainViewController: UIViewController, PointManagable {
    var mainPointManager = PointManager()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("viewDidDisappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        refreshPoint()
    }
    
    @IBOutlet weak var currentPoint: UILabel!
    
    @IBAction func touchRefreshButton(_ sender: Any) {
        refreshPoint()
    }
    
    func refreshPoint() {
        currentPoint.text = mainPointManager.point.description
    }
    
    @IBAction func moveToBuyingView(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Buying") as? BuyingViewController else { return }
        nextVC.delegate = self
        self.present(nextVC, animated: true)
    }
    
    func decreasePoint() {
            self.mainPointManager.point -= 50
    }
}

