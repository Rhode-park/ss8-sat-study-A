//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    let name: String
    let phoneNumber: String
}

class ViewController: UIViewController {
    let center:NotificationCenter = NotificationCenter.default
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    //var registrantList: [Registrant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        center.addObserver(forName: .init("register"), object: nil, queue: .main) { noti in
            //noti.object가 Any?이기 때문에 Registrant의 것들을 사용하기 위해서 다운캐스팅
            guard let object = noti.object as? Registrant else {
                return
            }
            //클로저 내부에선 캡쳐가 발생하여 self.붙여줘야함
            self.nameLabel.text = object.name
            self.phoneNumberLabel.text = object.phoneNumber
        }
    }
    
    @IBAction func hitRegisterButton(_ sender: Any) {
        guard let newName = nameTextField.text, let newPhoneNumber = phoneNumberTextField.text else {
            return
        }
        register(newName: newName, newPhoneNumber: newPhoneNumber)
    }
    
//    @IBAction func hitCheckButton(_ sender: Any) {
//        displayRegistrant()
//    }
    
    func register(newName: String, newPhoneNumber: String) {
        let newInformation = Registrant(name: newName, phoneNumber: newPhoneNumber)
//        registrantList.append(newInformation)
        nameTextField.text = ""
        phoneNumberTextField.text = ""
        center.post(name: .init("register"), object: newInformation)
    }
    
//    func displayRegistrant() {
//        nameLabel.text = registrantList.last?.name
//        phoneNumberLabel.text = registrantList.last?.phoneNumber
//    }
}
