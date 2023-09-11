//
//  Alarm.swift
//  crazyAlarm
//
//  Created by dani prayogi on 10/09/23.
//

import Foundation

enum TypeAlarm: String, Codable, CaseIterable {
    case math
    case pin
    case none
}

enum Day: String, Codable, CaseIterable {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

struct AlarmItem: Codable, Identifiable {
    let id: String
    let status: Bool
    let title: String
    let desc: String
    let days: [Day]?
    let type: TypeAlarm
    let createdDate: TimeInterval
}

let dummyItems: [AlarmItem] = [
    AlarmItem(id: "1", status: true, title: "Math Quiz", desc: "Solve math problems", days: [.monday, .wednesday, .friday], type: .math, createdDate: Date().timeIntervalSince1970),
    AlarmItem(id: "2", status: false, title: "PIN Lock", desc: "Enter PIN to unlock", days: nil, type: .pin, createdDate: Date().timeIntervalSince1970)
]
