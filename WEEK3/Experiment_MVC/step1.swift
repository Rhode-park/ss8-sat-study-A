////
////  step1.swift
////  Experiment_MVC
////
////  Created by 김경준 on 2023/01/07.
////
//
//import UIKit
//
//struct Registrant {
//    let name: String
//    let phoneNumber: String
//}
//
//class ViewController: UIViewController {
//    
//    @IBOutlet weak var nameTextField: UITextField!
//    @IBOutlet weak var phoneNumberTextField: UITextField!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var phoneNumberLabel: UILabel!
//    
//    var registrants: [Registrant] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    @IBAction func hitRegisterButton(_ sender: Any) {
//        register()
//    }
//    
//    @IBAction func hitCheckButton(_ sender: Any) {
//        displayRecentRegistrant()
//    }
//    
////    @IBAction func hitCheckPastButton(_ sender: Any) {
////        let positiveAlert = UIAlertController(title: "확인 결과", message: "이미 등록된 정보입니다.", preferredStyle: .alert)
////        let negativeAlert = UIAlertController(title: "확인 결과", message: "등록되지 않은 정보입니다.", preferredStyle: .alert)
////        let isRegistered = checkRegisteredInformation()
////        let defaultAction = UIAlertAction(title: "확인", style: .default)
////
////        switch isRegistered {
////        case true:
////            positiveAlert.addAction(defaultAction)
////            self.present(positiveAlert, animated: true)
////        case false:
////            negativeAlert.addAction(defaultAction)
////            self.present(negativeAlert, animated: true)
////        }
////    }
//    
//    func register() {
//        guard let registrantName = nameTextField.text,
//              let registrantPhoneNumber = phoneNumberTextField.text
//        else { return }
//        
//        let newRegistrant = Registrant(name: registrantName, phoneNumber: registrantPhoneNumber)
//        
//        registrants.append(newRegistrant)
//        nameTextField.text = ""
//        phoneNumberTextField.text = ""
//    }
//    
//    func displayRecentRegistrant() {
//        guard let registrantForDisplay = self.registrants.last else { return }
//        
//        nameLabel.text = registrantForDisplay.name
//        phoneNumberLabel.text = registrantForDisplay.phoneNumber
//    }
//    
//    func checkRegisteredInformation() -> Bool {
//        guard let targetRegistrant = generateRegistrant() else { return false }
//        let maxIndex = self.registrants.count - 1
//        let minIndex = 0
//        
//        for count in minIndex...maxIndex {
//            let target = self.registrants[count]
//            
//            if target.name == targetRegistrant.name &&
//                target.phoneNumber == targetRegistrant.phoneNumber {
//                nameLabel.text = target.name
//                phoneNumberLabel.text = target.phoneNumber
//                
//                return true
//            }
//        }
//        
//        return false
//    }
//    
//    func generateRegistrant() -> Registrant? {
//        guard let registrantName = nameTextField.text,
//              let registrantPhoneNumber = phoneNumberTextField.text
//        else { return nil }
//        
//        let targetRegistrant = Registrant(name: registrantName, phoneNumber: registrantPhoneNumber)
//        
//        return targetRegistrant
//    }
//}
