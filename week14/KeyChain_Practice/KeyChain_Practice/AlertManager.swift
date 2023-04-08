//
//  AlertManager.swift
//  KeyChain_Practice
//
//  Created by Jinah Park on 2023/04/08.
//

import UIKit

class AlertManager {
    static let shared = AlertManager()
    
    private init() {}
    
    func presentAlert(viewController: UIViewController, title: String, message: String, action: String = "확인", completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: action, style: .default) { _ in
            completion?()
        }
        
        alert.addAction(confirm)
        viewController.present(alert, animated: true)
    }
}
