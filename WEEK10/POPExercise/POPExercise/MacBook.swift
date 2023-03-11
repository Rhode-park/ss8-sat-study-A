//
//  MacBook.swift
//  POPExercise
//
//  Created by Rowan on 2023/03/11.
//

struct MacBook: Portable {
    let chargeableWattPerHour: WattPerHour
    let maximumBatteryCharge: Watt = 100
    var currentBatteryCharge: Watt
    
    mutating func chargeBattery(charger: Chargeable) {
        let wattPerHour = charger.convert(chargeableWattPerHour: self.chargeableWattPerHour)
        let chargeableBattery = self.maximumBatteryCharge - self.currentBatteryCharge
        let timeForCharge = Double(chargeableBattery) / Double(wattPerHour)
        
        guard let namedCharger = charger as? Charger else { return }
        
        print("현재 배터리 잔량 \(currentBatteryCharge)% 에서 \(namedCharger.name)를 사용한 완충시간은 \(timeForCharge)시간 입니다!")
    }
}
