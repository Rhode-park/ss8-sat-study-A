//
//  PurpleView.swift
//  week11
//
//  Created by 강민수 on 2023/03/18.
//

import UIKit

class PurpleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
     
        }
     
        if self.point(inside: point, with: event) {
            for subview in subviews {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    print(hitTestView)
                    return hitTestView
                }
            }
            print(self)
            return self
        }
        print("nil")
        return nil
    }
}
