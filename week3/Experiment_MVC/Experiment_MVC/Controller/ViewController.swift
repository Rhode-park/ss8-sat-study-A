//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    let name: String
    let phoneNumber: String
}

enum Names {
    case New
    case Old
    
    var name: Notification.Name {
        switch self {
        case .New:
            return Notification.Name("신규")
        case .Old:
            return Notification.Name("기존")
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var registrantList: [Registrant] = [] //Controller Property
    
    func decorateTextField() {
        self.nameTextField.placeholder = "이름을 입력해주세요"
        self.phoneNumberTextField.placeholder = "전화번호를 입력해주세요"
        self.nameTextField.clearButtonMode = .whileEditing
        self.phoneNumberTextField.clearButtonMode = .unlessEditing
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.decorateTextField()
        NotificationCenter.default.addObserver(self, selector: #selector(checkUser(noti:)), name: Names.New.name, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(checkUser(noti:)), name: Names.Old.name, object: nil)
    }
    
    @objc func checkUser(noti: Notification) {
        // 중복 구현
        guard let userState = noti.userInfo?["userInfo"] as? String else { return }
        
        showAlert(userState)
    }
    
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "\(message)유저입니다~~", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alertController.addAction(okAction)
        
        present(alertController, animated: true)
    }
    
    func postObserver(name: Names) {
        NotificationCenter.default.post(name: name.name, object: nil, userInfo: ["userInfo": name.name.rawValue])
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        guard let name = self.nameTextField.text,
                let phoneNumber = self.phoneNumberTextField.text else { return }
        register(name: name, phoneNumber: phoneNumber)
        
        self.nameTextField.text = ""
        self.phoneNumberTextField.text = ""
    }
    
    @IBAction func hitCheckButton(_ sender: Any) {
        guard let targetName = self.nameTextField.text,
                let targetPhoneNumber = self.phoneNumberTextField.text else { return }
        
        if checkDuplicates(name: targetName, phoneNumber: targetPhoneNumber) {
            self.nameLabel.text = targetName
            self.phoneNumberLabel.text = targetPhoneNumber
        }
    }
    
    func register(name: String, phoneNumber: String) {
        if checkDuplicates(name: name, phoneNumber: phoneNumber) {
            return
        } else {
            let registrant = Registrant(name: name, phoneNumber: phoneNumber)
            self.registrantList.append(registrant)
        }
    }
    
    func checkDuplicates(name: String, phoneNumber: String) -> Bool {
        if self.registrantList.contains(where: { registrant in
            if registrant.name == name &&
                registrant.phoneNumber == phoneNumber {
                return true
            } else {
                return false
            }
        }) {
            self.postObserver(name: Names.Old)
            return true
        } else {
            self.postObserver(name: Names.New)
            return false
        }
    }
}
