//
//  main.swift
//  POPExercise
//
//  Created by Rowan on 2023/03/11.
//

let appleWatchCharger = Charger(name: "애플워치 충전기",maximumWattPerHour: 5)
let iPhoneHighSpeedCharger = Charger(name: "아이폰 고속 충전기", maximumWattPerHour: 18)
let iPadCharger = Charger(name: "아이패드 충전기", maximumWattPerHour: 30)
let macBookCharger = Charger(name: "맥북 충전기", maximumWattPerHour: 96)
let betterMacBookCharger = Charger(name: "고급 맥북 충전기", maximumWattPerHour: 106)

var myMacBook = MacBook(chargeableWattPerHour: 96, currentBatteryCharge: 10)

myMacBook.chargeBattery(charger: iPadCharger)

myMacBook.currentBatteryCharge = 10
myMacBook.chargeBattery(charger: macBookCharger)

myMacBook.currentBatteryCharge = 10
myMacBook.chargeBattery(charger: betterMacBookCharger)

myMacBook.currentBatteryCharge = 10
myMacBook.chargeBattery(charger: appleWatchCharger)

myMacBook.currentBatteryCharge = 10
myMacBook.chargeBattery(charger: iPhoneHighSpeedCharger)

var gucciBag = Bag()

gucciBag.put(item: myMacBook)
gucciBag.put(item: macBookCharger)
gucciBag.checkBag()
