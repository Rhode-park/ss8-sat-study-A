//
//  main.swift
//  POPExercise
//
//  Created by Jinah Park on 2023/03/12.
//

typealias WattPerHour = Int
typealias Watt = Int

var rhodeMacBook = MacBook(name: "Rhode의 맥북", maximumWattPerHour: 65, currentBattery: 40)
let iphoneCharger = Charger.iphoneFastCharger
var diorBookTote = Bag()

diorBookTote.put(item: rhodeMacBook, iphoneCharger)
rhodeMacBook.chargeBattery(charger: iphoneCharger)
