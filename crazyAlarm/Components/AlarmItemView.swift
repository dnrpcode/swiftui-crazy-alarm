//
//  AlarmItemView.swift
//  crazyAlarm
//
//  Created by dani prayogi on 11/09/23.
//

import SwiftUI

struct AlarmItemView: View {
    let item: AlarmItem
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Text(item.desc)
                    .font(.subheadline)
                Text("Days: \(formatDays(item.days))")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Text(item.type.rawValue.capitalized)
                .font(.callout)
                .padding(8)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
        }
    }
    
    func formatDays(_ days: [Day]?) -> String {
        guard let days = days else { return "Not specified" }
        return days.map { $0.rawValue.capitalized }.joined(separator: ", ")
    }
}

struct AlarmItemView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyItem = AlarmItem(
            id: "1",
            status: true,
            title: "Math Quiz",
            desc: "Solve math problems",
            days: [.monday, .wednesday, .friday],
            type: .math,
            createdDate: Date().timeIntervalSince1970
        )
        AlarmItemView(item: dummyItem)
    }
}
