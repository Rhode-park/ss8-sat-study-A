//
//  BugerView.swift
//  Buger
//
//  Created by 강민수 on 2023/05/06.
//

import UIKit

@IBDesignable
class BugerView: UIView {
    
    @IBInspectable var lineWidth: CGFloat = 10
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // 패티
        let bugerFirstWidth = self.frame.width / 2 - 100
        var lastHeight: CGFloat = 0
        
        let bugerArc = UIBezierPath(arcCenter: CGPoint(x: self.frame.width / 2, y: self.frame.width), radius: 100, startAngle: .pi, endAngle: 0, clockwise: true)
        UIColor.systemBrown.setStroke()
        bugerArc.lineWidth = lineWidth
        bugerArc.stroke()
        
        let bugerPath = UIBezierPath()
        bugerPath.move(to: CGPoint(x: self.frame.width / 2 - 100, y: self.frame.width))
        bugerPath.addLine(to: CGPoint(x: self.frame.width / 2 + 100, y: self.frame.width))
        bugerPath.lineWidth = lineWidth
        bugerPath.stroke()
        
        // 당근
        let carrotPath = UIBezierPath()
        
        UIColor.systemOrange.setStroke()
        
        for x in 0..<7 {
            carrotPath.move(to: CGPoint(x: bugerFirstWidth + CGFloat((30 * x)), y: self.frame.width + 20))
            carrotPath.addLine(to: CGPoint(x: bugerFirstWidth + CGFloat((30 * x)) + 20, y: self.frame.width + 60))
            
            lastHeight = self.frame.width + 60
        }
        
        carrotPath.lineWidth = lineWidth
        carrotPath.stroke()
        
        // 토마토
        let tomatoPath = UIBezierPath()
        
        UIColor.systemRed.setStroke()
        lastHeight += 20
        
        tomatoPath.move(to: CGPoint(x: bugerFirstWidth, y: lastHeight))
        tomatoPath.addLine(to: CGPoint(x: bugerFirstWidth + 95, y: lastHeight))
        
        tomatoPath.move(to: CGPoint(x: bugerFirstWidth + 110, y: lastHeight))
        tomatoPath.addLine(to: CGPoint(x: bugerFirstWidth + 200, y: lastHeight))
        
        tomatoPath.lineWidth = lineWidth * 2
        tomatoPath.stroke()
        
        // 양상추
        let trashPath = UIBezierPath()
        
        UIColor.systemGreen.setStroke()
        lastHeight += 20
        
        trashPath.move(to: CGPoint(x: bugerFirstWidth, y: lastHeight))
        trashPath.addLine(to: CGPoint(x: bugerFirstWidth + 200, y: lastHeight + 30))
        
        trashPath.lineWidth = lineWidth / 2
        trashPath.stroke()
    }
}
