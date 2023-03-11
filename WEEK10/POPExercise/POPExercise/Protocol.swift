//
//  Protocol.swift
//  POPExercise
//
//  Created by Rowan on 2023/03/11.
//

typealias WattPerHour = Int
typealias Watt = Int

protocol Chargeable {
    var maximumWattPerHour: WattPerHour { get }
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour
}
