//
//  ViewController.swift
//  week11
//
//  Created by 강민수 on 2023/03/18.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        let touchesView = self.view.hitTest(touches.first!.location(in: self.view), with: event)
        
        if touchesView?.restorationIdentifier == "OrangeView",
           let customView = touchesView as? CustomView {
            customView.taptaptap()
        } else {
            print("View")
        }
    }
}
