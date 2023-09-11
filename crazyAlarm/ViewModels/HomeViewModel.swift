//
//  HomeViewModel.swift
//  crazyAlarm
//
//  Created by dani prayogi on 11/09/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var showingChangeAlarm: Bool = false
    @Published var selectedItem: AlarmItem? = nil
    
    func delete(id: String) {
    }
}
