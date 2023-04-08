//
//  ChangePasswordViewController.swift
//  KeyChain_Practice
//
//  Created by Jinah Park on 2023/04/08.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    let account = "Rhod"
    let keyChainManager = KeychainManager.shared
    let alertManager = AlertManager.shared
    
    @IBOutlet weak var currentPWTextField: UITextField!
    @IBOutlet weak var newPWTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapChangePasswordButton(_ sender: Any) {
        do {
            let loaded = try keyChainManager.readKeyChain(account: account)
            guard loaded.password == currentPWTextField.text else {
                alertManager.presentAlert(viewController: self, title: "비밀번호 불일치", message: "등록된 비밀번호와 입력한 비밀번호가 일치하지 않습니다.")
                
                return
            }
        } catch {
            alertManager.presentAlert(viewController: self, title: "에러", message: "\(error)")
        }
        
        do {
            let passwordRegex = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,16}"
            let validPw = newPWTextField.text?.range(of: passwordRegex, options: .regularExpression) != nil
            
            if validPw {
                guard let newPassword = newPWTextField.text, !newPassword.isEmpty else {
                    alertManager.presentAlert(viewController: self, title: "비밀번호 입력 요망", message: "비밀번호를 입력해주세요.")
                    
                    return
                }
                
                let credentials = Credentials(userName: account, password: newPassword)
                
                try keyChainManager.updateKeyChain(credentials: credentials)
                
                alertManager.presentAlert(viewController: self, title: "비밀번호 변경 성공", message: "비밀번호가 변경되었습니다.") {
                    self.dismiss(animated: true)
                }
            } else {
                alertManager.presentAlert(viewController: self, title: "비밀번호 오류", message: "영어 대소문자, 숫자, 특수기호를 넣어 8자리 이상 16자리 이하 비밀번호를 만들어주세요.")
            }
        } catch {
            alertManager.presentAlert(viewController: self, title: "에러", message: "\(error)")
        }
    }
    
}
