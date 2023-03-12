//
//  MacBook.swift
//  POPExercise
//
//  Created by Jinah Park on 2023/03/12.
//

struct MacBook {
    let maximumWattPerHour: Int
    var currentBattery: Int
    let maximumBattery: Int = 100
    
    init(maximumWattPerHour: Int, currentBattery: Int) {
        self.maximumWattPerHour = maximumWattPerHour
        self.currentBattery = currentBattery
    }
    
    func chargeBattery(charger: Chargeable) {
        var batteryToBeCharged = maximumBattery - currentBattery
        var chargeTime = Double(batteryToBeCharged) / Double(charger.convert(chargeableWattPerHour: maximumWattPerHour))
        
        print("기존 저장된 배터리는 \(currentBattery)W였으며, \(charger.name)을 사용하여 완충까지 \(chargeTime)시간 걸렸습니다.")
    }
}
