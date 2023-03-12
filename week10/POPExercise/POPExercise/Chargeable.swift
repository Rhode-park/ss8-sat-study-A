//
//  Chargeable.swift
//  POPExercise
//
//  Created by Jinah Park on 2023/03/12.
//

protocol Chargeable {
    var maximumWattPerHour: WattPerHour { get set }
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour
}
