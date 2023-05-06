//
//  burgerView.swift
//  Core Graphics
//
//  Created by Jinah Park on 2023/05/06.
//

import Foundation
import UIKit

@IBDesignable
class burgerView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let bottomBun = UIBezierPath(roundedRect: CGRect(x: 55, y:bounds.midY-20, width: 250, height: 35),cornerRadius: 10)
        UIColor.systemBrown.setStroke()
        bottomBun.lineWidth = 10
        bottomBun.stroke()
        
        let pattie = UIBezierPath(roundedRect: CGRect(x: 30, y:bounds.midY-60, width: 300, height: 20),cornerRadius: 20)
        UIColor.systemBrown.setFill()
        UIColor.systemBrown.setStroke()
        pattie.lineWidth = 10
        pattie.stroke()
        pattie.fill()
        
        for i in 1...7 {
            let lettuceOne = UIBezierPath(arcCenter: CGPoint(x: 40*i, y: Int(bounds.midY)-90), radius: 10, startAngle: 0, endAngle: CGFloat.pi, clockwise: true)
            UIColor.systemGreen.setStroke()
            lettuceOne.lineWidth = 10
            lettuceOne.stroke()

            let lettuceTwo = UIBezierPath(arcCenter: CGPoint(x: 40*i+20, y: Int(bounds.midY)-90), radius: 10, startAngle: CGFloat.pi, endAngle: 0, clockwise: true)
            UIColor.systemGreen.setStroke()
            lettuceTwo.lineWidth = 10
            lettuceTwo.stroke()
        }
        
        let lettuceOne = UIBezierPath(arcCenter: CGPoint(x: 320, y: Int(bounds.midY)-90), radius: 10, startAngle: 0, endAngle: CGFloat.pi, clockwise: true)
        UIColor.systemGreen.setStroke()
        lettuceOne.lineWidth = 10
        lettuceOne.stroke()
        
        let topBun = UIBezierPath(arcCenter: CGPoint(x: 170, y: Int(bounds.midY)-150), radius: 125, startAngle: CGFloat.pi, endAngle: 0, clockwise: true)
        UIColor.systemBrown.setStroke()
        topBun.lineWidth = 10
        topBun.close()
        topBun.stroke()
    }
}
