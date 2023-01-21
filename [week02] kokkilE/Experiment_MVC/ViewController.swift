// Step 1

// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

//import UIKit
//
//// model
//struct Registrant {
//    let name: String
//    let phonNumber: String
//}
//
//class ViewController: UIViewController {
//
////    let center: NotificationCenter = NotificationCenter.default
////     var channelName: Notification.Name
////
////     init(channelName: Notification.Name) {
////         self.channelName = channelName
////     }
////
////     func broadcast() {
////         center.post(name: channelName, object: nil)
////     }
//
//    // controller
//    @IBOutlet weak var nameTextField: UITextField!
//    @IBOutlet weak var phoneNumberTextField: UITextField!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var phoneNumberLabel: UILabel!
//
//    // model
//    var registrantList: [Registrant] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//    // controller
//    @IBAction func hitRegisterButton(_ sender: Any) {
//        register()
//    }
//
//    // controller
//    @IBAction func hitCheckButton(_ sender: Any) {
//        guard let name = registrantList.last?.name,
//              let phonNumber = registrantList.last?.phonNumber else {
//            return
//        }
//        nameLabel.text = name
//        phoneNumberLabel.text = phonNumber
//    }
//
//    // model? controller?
//    func register() {
//        guard let registedName = nameTextField.text,
//              let gegistedPhoneNumber = phoneNumberTextField.text else {
//            return
//        }
//        registrantList.append(
//            Registrant(name: registedName, phonNumber: gegistedPhoneNumber))
//    }
//}
//---------------------


// Step 2

import UIKit

// model
struct Registrant {
    let name: String
    let phonNumber: String
    
    var registrantList: [Registrant] = []
    
    func register() {
//        guard let registedName = nameTextField.text,
//              let gegistedPhoneNumber = phoneNumberTextField.text else {
//            return
        }
        //registrantList.append(
            //Registrant(name: registedName, phonNumber: gegistedPhoneNumber))
        
        //center.post(name: "newRegistrant", object: (registedName, gegistedPhoneNumber))
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}

class ViewController: UIViewController {

    let center: NotificationCenter = NotificationCenter.default

    // controller
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!

    // model
    //var registrantList: [Registrant] = []

    func decorateTextField() {
        self.nameTextField.placeholder = "이름을 입력해주세요"
        self.phoneNumberTextField.placeholder = "전화번호를 입력해주세요"
        self.nameTextField.clearButtonMode = .whileEditing
        self.phoneNumberTextField.clearButtonMode = .whileEditing
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        decorateTextField()
    }

    
    
    // controller
    @IBAction func hitRegisterButton(_ sender: Any) {
        //register()
    }

    // controller
    @IBAction func hitCheckButton(_ sender: Any) {
//        guard let name = registrantList.last?.name,
//              let phonNumber = registrantList.last?.phonNumber else {
//            return
        }
//        nameLabel.text = name
//        phoneNumberLabel.text = phonNumber
    }
    
    func postObserver() {
        //NotificationCenter.default.post(name: Notification.Name("test"), object: (nameTextField, phoneNumberTextField))
        //NotificationCenter.default.addObserver(<#T##observer: Any##Any#>, selector: <#T##Selector#>, name: Notification.Name("test"), object: nil)
    //}
}



//class Bank: NSObject {
//    @objc dynamic var jango: Int = 10000
//}
//
//class BankManager: NSObject {
//    @objc var bank: Bank
//    var observation: NSKeyValueObservation?
//
//    init(bank: Bank) {
//        self.bank = bank
//
//        super.init()
//
//        observation = observe(\.bank.jango,
//                               options: [.old, .new],
//                               changeHandler: { manager, change in
//            print("은행 잔고가 변경됐습니다 : \(change.oldValue) -> \(change.newValue)")
//        })
//    }
//}
//
//let hankookBank: Bank = Bank()
//let manager: BankManager = BankManager(bank: hankookBank)
//
//hankookBank.jango = 99
//hankookBank.jango = 288
//
//
//// Notification / Notification Center
//let yagom: Person = Person(weight: 65)
//let center: NotificationCenter = NotificationCenter.default
//
//class Youtuber {
//    var channelName: Notification.Name
//
//    init(channelName: Notification.Name) {
//        self.channelName = channelName
//    }
//
//    func broadcast() {
//        center.post(name: channelName, object: nil)
//    }
//}
//
//class Subscriber {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    func subscribe(_ name: Notification.Name) {
//        center.addObserver(self,
//                           selector: #selector(didReceiveBroadcast),
//                           name: name,
//                           object: nil)
//
//        center.addObserver(forName: name,
//                           object: nil,
//                           queue: .main) { noti in
//            print("\(self.name) 와우 방송시작!! \(noti.name)")
//        }
//    }
//
////    @objc func didReceiveBroadcast(_ notification: Notification) {
////        print("\(name) 와우 방송시작!! \(notification.name)")
////    }
//
//    func unsubscribe(_ name: Notification.Name) {
//        center.removeObserver(self,
//                              name: name,
//                              object: nil)
//    }
//}
//
//let rillaNotificationName = Notification.Name("우끼끼")
//let rhodeNotificationName = Notification.Name("빵야빵야")
//
//let rilla: Youtuber = Youtuber(channelName: rillaNotificationName)
//let rhode: Youtuber = Youtuber(channelName: rhodeNotificationName)
//
//let kaki: Subscriber = Subscriber(name: "카키")
//let brody: Subscriber = Subscriber(name: "브로디")
//let andrew: Subscriber = Subscriber(name: "앤드류")
//
//kaki.subscribe(rillaNotificationName)
//kaki.unsubscribe(rillaNotificationName)
//kaki.subscribe(rhodeNotificationName)
//
//brody.subscribe(rillaNotificationName)
//
//andrew.subscribe(rhodeNotificationName)
//
//rhode.broadcast()
//print("--------")
//rilla.broadcast()
