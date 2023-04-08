//
//  UpdatePasswordViewController.swift
//  KeyChain_Practice
//
//  Created by kokkilE on 2023/04/08.
//

import UIKit

class UpdatePasswordViewController: UIViewController {
    @IBOutlet weak var beforePWTextField: UITextField!
    @IBOutlet weak var afterPWTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func touchUpChangeButton(_ sender: Any) {
        do {
            let password = try KeychainManager.shared.readKeychain(username)
            guard password == beforePWTextField.text else {
                showAlert(title: "기존 PW가 일치하지 않습니다.", message: nil)
                return
            }
        } catch {
            showAlert(title: "변경 실패! 키체인 에러", message: nil)
        }
        
        do {
            guard let changedPassword = afterPWTextField.text else { return }
            
            try KeychainManager.shared.updateKeychain(Credentials(username: username, password: changedPassword))
            showAlert(title: "비밀번호 변경 성공!", message: nil) {_ in
                self.dismiss(animated: true)
            }
    
        } catch {
            showAlert(title: "변경 실패! 키체인 에러\(error)", message: nil)
        }
    }
    
    private func showAlert(title: String?, message: String?, completion: ((UIAlertAction) -> Void)? = nil ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: completion)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
