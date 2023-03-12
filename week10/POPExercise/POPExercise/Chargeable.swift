//
//  Chargeable.swift
//  POPExercise
//
//  Created by Jinah Park on 2023/03/12.
//

protocol Chargeable {
    var maximumWattPerHour: WattPerHour { get }
    var name: String { get }
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour
}
