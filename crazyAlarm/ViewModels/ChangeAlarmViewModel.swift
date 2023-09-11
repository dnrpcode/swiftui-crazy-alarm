//
//  ChangeAlarmViewModel.swift
//  crazyAlarm
//
//  Created by dani prayogi on 11/09/23.
//

import Foundation

class ChangeAlarmViewModel: ObservableObject {
    init() {}
    
    @Published var titleHeader = "Add Todo"
    @Published var showAlert = false

    @Published var newId = UUID().uuidString
    @Published var status = true
    @Published var title = ""
    @Published var desc = ""
    @Published var days: [Day]? = []
    @Published var type: TypeAlarm = TypeAlarm.none
    @Published var createdDate = Date().timeIntervalSince1970
    
    init(data: AlarmItem?) {
        if let data = data {
            self.titleHeader = "Edit Todo"
            
            self.newId = data.id
            self.status = data.status
            self.title = data.title
            self.desc = data.desc
            self.days = data.days
            self.type = data.type
            self.createdDate = data.createdDate
        }
    }
    
    func save(){
        guard canSave else {
            return
        }
        
        //save data()
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
}
