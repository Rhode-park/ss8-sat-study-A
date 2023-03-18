//
//  CustomView.swift
//  responder-chain
//
//  Created by Jinah Park on 2023/03/18.
//

import Foundation
import UIKit

class CustomView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
     
        }
     
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
//                    print(hitTestView.superview)
                    return hitTestView
                }
            }
//            print(self.superview)
            return self
        }
        print(self.superview)
        return nil
    }
}

//extension CustomView {
//    override var description: String {
//        return String(describing: self)
//    }
//}
