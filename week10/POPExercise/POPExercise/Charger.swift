//
//  Charger.swift
//  POPExercise
//
//  Created by Jinah Park on 2023/03/12.
//

enum Charger: Chargeable {
    case appleWatchCharger
    case iphoneFastCharger
    case ipadCharger
    case macBookCharger
    case macBookFastCharger
    
    var name: String {
        switch self {
        case .appleWatchCharger:
            return "5Wh 애플워치 충전기"
        case .iphoneFastCharger:
            return "18Wh 아이폰 고속 충전기"
        case .ipadCharger:
            return "30Wh 아이패드 충전기"
        case .macBookCharger:
            return "96Wh 맥북 충전기"
        case .macBookFastCharger:
            return "106Wh 맥북 충전기"
        }
    }
    
    var maximumWattPerHour: WattPerHour {
        switch self {
        case .appleWatchCharger:
            return 5
        case .iphoneFastCharger:
            return 18
        case .ipadCharger:
            return 30
        case .macBookCharger:
            return 96
        case .macBookFastCharger:
            return 106
        }
    }
    
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour {
        return min(chargeableWattPerHour, maximumWattPerHour)
    }
}
