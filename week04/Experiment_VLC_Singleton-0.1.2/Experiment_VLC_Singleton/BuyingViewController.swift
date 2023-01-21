//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class BuyingViewController: UIViewController {
    let pointManager = PointManager.shared
    
    @IBOutlet weak var buyingButton: UIButton!
    
    override func loadView() {
        super.loadView()
        print("2: loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2: viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("2: vieWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("2: viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("2: viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("2: viewDidDisappear")
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapBuyingButton(_ sender: UIButton) {
        buyTopper()
        dismiss(animated: true, completion: nil)
    }
    
    func buyTopper() {
        pointManager.point -= 50
    }
    
    
}
