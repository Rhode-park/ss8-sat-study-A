//
//  ViewController.swift
//  UIViewAnimation
//
//  Created by 조향래 on 2023/04/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    lazy var frame = imageView.frame
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "yagom")
        frame = imageView.frame
    }
    
    @IBAction func touchUpErrorButton(_ sender: Any) {
        
        UIView.animate(withDuration: 0.05, delay: 0, options: [.repeat], animations: {
            self.imageView.transform = CGAffineTransform(translationX: -6, y: 0)
            self.imageView.transform = CGAffineTransform(translationX: 6, y: 0)
        })
    }
    
    @IBAction func touchUpNewMacButton(_ sender: Any) {
        UIView.animateKeyframes(withDuration: 0.6, delay: 0, options: [.repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0/4.0) {
                self.imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 1.0/4.0, relativeDuration: 1.0/4.0) {
                self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }

            UIView.addKeyframe(withRelativeStartTime: 2.0/4.0, relativeDuration: 1.0/4.0) {
                self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1.5)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 3.0/4.0, relativeDuration: 1.0/4.0) {
                self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }

        }
    }
    
    @IBAction func touchUpCustomButton(_ sender: Any) { }
    
    @IBAction func touchUpRollBackButton(_ sender: Any) {
        
        imageView.layer.removeAllAnimations()
        
        imageView.transform = CGAffineTransform(translationX: 0, y: 0)
    }
}

