//
//  main.swift
//  POPExercise
//
//  Created by Jinah Park on 2023/03/12.
//

typealias WattPerHour = Int
typealias Watt = Int

var rhodeMacBook = MacBook(user: "Rhode", maximumWattPerHour: 65, currentBattery: 40)
let iphoneCharger = Charger.iphoneFastCharger

rhodeMacBook.chargeBattery(charger: iphoneCharger)
