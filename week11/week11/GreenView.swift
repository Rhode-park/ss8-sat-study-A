//
//  GreenView.swift
//  week11
//
//  Created by 강민수 on 2023/03/18.
//

import UIKit

class GreenView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(taptaptap))
        
        self.addGestureRecognizer(gesture)
    }
    
    @objc func taptaptap() {
        if self.backgroundColor == .black {
            self.backgroundColor = .systemGreen
        } else {
            self.backgroundColor = .black
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
     
        if self.point(inside: point, with: event) {
            for subview in subviews {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
//                    print(hitTestView.restorationIdentifier)
                    return hitTestView
                }
            }
            
            if self.restorationIdentifier == "OrangeView" {
                taptaptap()
            }
//            print(self.restorationIdentifier)
            return self
        }
        
//        print("nil")
        return nil
    }
}
