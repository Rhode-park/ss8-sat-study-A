//
//  ViewController.swift
//  KeyChain_Practice
//
//  Created by coda on 2022/01/10.
//

import UIKit

class LogInViewController: UIViewController {
    let account = "Rhode"
    let keyChainManager = KeychainManager.shared
    
    @IBOutlet weak var pwTextField: UITextField!
    var diaryViewController: DiaryViewController?
    var changePasswordViewController: ChangePasswordViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryViewController = self.storyboard?.instantiateViewController(withIdentifier: "diary") as? DiaryViewController
    }
    
    @IBAction func tapLogInButton(_ sender: Any) {
        
        do {
            let loaded = try keyChainManager.readKeyChain(account: account)
            guard loaded.password == pwTextField.text else {
                let alert = UIAlertController(title: "비밀번호 불일치", message: "등록된 비밀번호와 입력한 비밀번호가 일치하지 않습니다.", preferredStyle: .alert)
                let confirm = UIAlertAction(title: "돌아가기", style: .default)
                
                alert.addAction(confirm)
                present(alert, animated: true)
                
                return
            }
        } catch {
            let alert = UIAlertController(title: "에러", message: "\(error.localizedDescription)", preferredStyle: .alert)
            let confirm = UIAlertAction(title: "돌아가기", style: .default)
            
            alert.addAction(confirm)
            present(alert, animated: true)
        }
        
        guard let diaryViewController = diaryViewController else { return }
        diaryViewController.modalPresentationStyle = .fullScreen
        present(diaryViewController, animated: true)
    }
    
    @IBAction func addNewPassword(_ sender: Any) {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,16}"
        let validPw = pwTextField.text?.range(of: passwordRegex, options: .regularExpression) != nil
        
        if validPw {
            guard let newPassword = pwTextField.text, !newPassword.isEmpty else {
                let alert = UIAlertController(title: "비밀번호 입력 요망", message: "비밀번호를 입력해주세요.", preferredStyle: .alert)
                let confirm = UIAlertAction(title: "확인", style: .default)
                
                alert.addAction(confirm)
                present(alert, animated: true)
                
                return
            }
            
            let credentials = Credentials(userName: account, password: newPassword)
            
            do {
                try keyChainManager.createKeychain(credentials: credentials)
                let alert = UIAlertController(title: "성공", message: "비밀번호가 성공적으로 등록되었습니다.", preferredStyle: .alert)
                let confirm = UIAlertAction(title: "확인", style: .default)
                
                alert.addAction(confirm)
                present(alert, animated: true)
            } catch {
                let alert = UIAlertController(title: "비밀번호 오류", message: "영어 대소문자, 숫자, 특수기호를 넣어 8자리 이상 16자리 이하 비밀번호를 만들어주세요.", preferredStyle: .alert)
                let confirm = UIAlertAction(title: "확인", style: .default)
                
                alert.addAction(confirm)
                present(alert, animated: true)
            }
        }
    }
    
    @IBAction func tapChangePasswordButton(_ sender: UIButton) {
        guard let changePasswordViewController = changePasswordViewController else { return }
        changePasswordViewController.modalPresentationStyle = .fullScreen
        present(changePasswordViewController, animated: true)
    }
}

