//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

class BuyingViewController: UIViewController {
    
//    let point = PointManager.shared
    private let price = 50
    var delegate: Delegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func didTapBuyButton(_ sender: UIButton) {
//        self.point.point -= 50
        self.delegate?.buy(self.price)
        dismiss(animated: true, completion: nil)
    }
}
