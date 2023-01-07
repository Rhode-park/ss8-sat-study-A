//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

// Model에 빼줘야하는게 아닌지???
struct Registrant {
    let name: String
    let phoneNumber: String
}

class ViewController: UIViewController {
    
    // view (라벨, 버튼)
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var checkPastButton: UIButton!
    
    let center: NotificationCenter = NotificationCenter.default
    let registerNotificationName = Notification.Name("지금 등록하기")
    var registrants: [Registrant] = []
    // ------------------------------------------------
    // Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        center.addObserver(self, selector: #selector(append(noti:)), name: registerNotificationName, object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func append(noti: Notification) {
        if let newObject = noti.userInfo?["new"] as? Registrant {
            self.registrants.append(newObject)
            print("추가완료")
        }
    }
    
    @IBAction func hitRegisterButton(_ sender: Any) {
        register()
    }
    
    @IBAction func hitCheckButton(_ sender: Any) {
        displayRecentRegistrant()
    }
    
    @IBAction func hitCheckPastButton(_ sender: Any) {
        let positiveAlert = UIAlertController(title: "확인 결과", message: "이미 등록된 정보입니다.", preferredStyle: .alert)
        let negativeAlert = UIAlertController(title: "확인 결과", message: "등록되지 않은 정보입니다.", preferredStyle: .alert)
        let isRegistered = checkRegisteredInformation()
        let defaultAction = UIAlertAction(title: "확인", style: .default)
        
        switch isRegistered {
        case true:
            positiveAlert.addAction(defaultAction)
            self.present(positiveAlert, animated: true)
        case false:
            negativeAlert.addAction(defaultAction)
            self.present(negativeAlert, animated: true)
        }
    }
    
    func register() {
        guard let registrantName = nameTextField.text,
              let registrantPhoneNumber = phoneNumberTextField.text
        else { return }
        
        let newRegistrant = Registrant(name: registrantName, phoneNumber: registrantPhoneNumber)
        
        //        registrantList.append(newRegistrant)
        
        center.post(name: registerNotificationName, object: nil, userInfo: ["new": newRegistrant])
        
        nameTextField.text = ""
        phoneNumberTextField.text = ""
    }
    
    func displayRecentRegistrant() {
        guard let registrantForDisplay = self.registrants.last else { return }
        
        nameLabel.text = registrantForDisplay.name
        phoneNumberLabel.text = registrantForDisplay.phoneNumber
    }
    
    func checkRegisteredInformation() -> Bool {
        guard let targetRegistrant = generateRegistrant() else { return false }
        let maxIndex = self.registrants.count - 1
        let minIndex = 0
        
        for count in minIndex...maxIndex {
            let target = self.registrants[count]
            
            if target.name == targetRegistrant.name &&
                target.phoneNumber == targetRegistrant.phoneNumber {
                nameLabel.text = target.name
                phoneNumberLabel.text = target.phoneNumber
                
                return true
            }
        }
        
        return false
    }
    
    func generateRegistrant() -> Registrant? {
        guard let registrantName = nameTextField.text,
              let registrantPhoneNumber = phoneNumberTextField.text
        else { return nil }
        
        let targetRegistrant = Registrant(name: registrantName, phoneNumber: registrantPhoneNumber)
        
        return targetRegistrant
    }
}






