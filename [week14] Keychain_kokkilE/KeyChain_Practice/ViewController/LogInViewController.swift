//
//  ViewController.swift
//  KeyChain_Practice
//
//  Created by coda on 2022/01/10.
//

import UIKit

// MARK: STEP 2

let username = "kokkilE7"

class LogInViewController: UIViewController {
    
    @IBOutlet weak var pwTextField: UITextField!
    var diaryViewController: DiaryViewController?
    var updatePasswordViewController: UpdatePasswordViewController?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryViewController = self.storyboard?.instantiateViewController(withIdentifier: "diary") as? DiaryViewController
        updatePasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "update") as? UpdatePasswordViewController
    }
    
    @IBAction func tapLogInButton(_ sender: Any) {
        do {
            let password = try KeychainManager.shared.readKeychain(username)
            guard password == pwTextField.text else {
                showAlert(title: "로그인 실패! 틀린 비밀번호", message: nil)
                return
            }
        } catch {
            showAlert(title: "로그인 실패! 등록되지 않은 ID", message: nil)
        }
        
        guard let diaryViewController = diaryViewController else { return }
        diaryViewController.modalPresentationStyle = .fullScreen
        present(diaryViewController, animated: true)
    }
    
    @IBAction func addNewPassword(_ sender: Any) {
        guard let password = pwTextField.text else { return }
        
        do {
            try KeychainManager.shared.createKeychain(Credentials(username: username, password: password))
            showAlert(title: "비밀번호 등록 성공!", message: nil)
        } catch KeychainError.duplicateError {
            showAlert(title: "비밀번호 등록 실패! 이미 존재하는 ID입니다.", message: nil)
        } catch {
            showAlert(title: "비밀번호 등록 실패! 키체인 에러 \(error)", message: nil)
        }
    }
    
    @IBAction func updatePassword(_ sender: Any) {
        guard let updatePasswordViewController = updatePasswordViewController else { return }
        present(updatePasswordViewController, animated: true)
    }
    
    private func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}

// MARK: STEP 1
//class LogInViewController: UIViewController {
//
//    @IBOutlet weak var pwTextField: UITextField!
//    var diaryViewController: DiaryViewController?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        diaryViewController = self.storyboard?.instantiateViewController(withIdentifier: "diary") as? DiaryViewController
//    }
//
//    @IBAction func tapLogInButton(_ sender: Any) {
//        guard UserDefaultsManager.shared.readUserDefault(key: "password") == pwTextField.text else {
//            showAlert(title: "로그인 실패!", message: nil)
//            return
//        }
//
//        guard let diaryViewController = diaryViewController else { return }
//        diaryViewController.modalPresentationStyle = .fullScreen
//        present(diaryViewController, animated: true)
//    }
//
//    @IBAction func addNewPassword(_ sender: Any) {
//        UserDefaultsManager.shared.createUserDefault(value: pwTextField.text, key: "password")
//        showAlert(title: "패스워드 등록!", message: nil)
//    }
//
//    private func showAlert(title: String?, message: String?) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default)
//
//        alert.addAction(okAction)
//
//        present(alert, animated: true)
//    }
//}
//
//class UserDefaultsManager {
//    static let shared = UserDefaultsManager()
//
//    private init() { }
//
//    private let storage = UserDefaults.standard
//
//    func createUserDefault(value: String?, key: String) {
//        storage.set(value, forKey: key)
//    }
//
//    func readUserDefault(key: String) -> String? {
//        return storage.string(forKey: key)
//    }
//}
