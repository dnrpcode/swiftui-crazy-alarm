//
//  Alarm.swift
//  crazyAlarm
//
//  Created by dani prayogi on 10/09/23.
//

import Foundation

enum TypeAlarm: String, Codable {
    case math
    case pin
}

enum Day: String, Codable {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let status: Bool
    let title: String
    let desc: String
    let days: [Day]?
    let type: TypeAlarm
    let createdDate: TimeInterval
}
