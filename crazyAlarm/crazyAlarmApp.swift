//
//  crazyAlarmApp.swift
//  crazyAlarm
//
//  Created by dani prayogi on 10/09/23.
//

import SwiftUI

@main
struct crazyAlarmApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
