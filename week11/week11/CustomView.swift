import UIKit

class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(taptaptap))
//
//        self.addGestureRecognizer(gesture)
    }
    
    @objc func taptaptap() {
        guard let selfSuperView = self.superview as? CustomView else { return }
        
        if selfSuperView.backgroundColor == .black {
            selfSuperView.backgroundColor = .systemGreen
        } else {
            selfSuperView.backgroundColor = .black
        }
    }
        
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
     
        }
     
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    return hitTestView
                }
            }
            return self
        }
        return nil
    }

}
