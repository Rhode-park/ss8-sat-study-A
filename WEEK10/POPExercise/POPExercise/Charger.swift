//
//  Charger.swift
//  POPExercise
//
//  Created by Rowan on 2023/03/11.
//

struct Charger: Chargeable, Portable {
    let name: String
    let maximumWattPerHour: WattPerHour
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour {
        chargeableWattPerHour < self.maximumWattPerHour ? chargeableWattPerHour : self.maximumWattPerHour
    }
}
