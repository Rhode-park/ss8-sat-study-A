//
//  MacBook.swift
//  POPExercise
//
//  Created by Jinah Park on 2023/03/12.
//

import Foundation

struct MacBook {
    let user: String
    let maximumWattPerHour: WattPerHour
    var currentBattery: Watt {
        didSet {
            print("현재 저장된 배터리는 \(currentBattery)W입니다.")
        }
    }
    let maximumBattery: Watt
    
    init(user: String, maximumWattPerHour: Int, currentBattery: Int, maximumBattery: Int = 100) {
        self.user = user
        self.maximumWattPerHour = maximumWattPerHour
        self.currentBattery = currentBattery
        self.maximumBattery = maximumBattery
    }
    
    mutating func chargeBattery(charger: Chargeable) {
        print("\(user)의 맥북을 충전합니다.")
        print("충전 중...")
        let chargeTime = calculateChargingTime(charger: charger)
        let formattedChargeTime = String(format: "%.2f", chargeTime)
        
        print("기존 저장된 배터리는 \(currentBattery)W였으며, \(charger.name)을 사용하여 완충까지 \(formattedChargeTime)시간 걸렸습니다.")
        
        currentBattery = maximumBattery
    }
    
    func calculateChargingTime(charger: Chargeable) -> Double {
        let batteryToBeCharged = maximumBattery - currentBattery
        let chargeTime = Double(batteryToBeCharged) / Double(charger.convert(chargeableWattPerHour: maximumWattPerHour))
        
        return chargeTime
    }
}
