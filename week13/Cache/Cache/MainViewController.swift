//
//  MainViewController.swift
//  Cache
//
//  Created by Jinah Park on 2023/04/01.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    
    let firstURL = "https://wallpaperaccess.com/download/europe-4k-1369012"
    let secondURL = "https://wallpaperaccess.com/download/europe-4k-1318341"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func touchUpInsideFirstImage(_ sender: Any) {
        
    }
    
    @IBAction func touchUpInsideSecondImage(_ sender: Any) {
    }
    
}
