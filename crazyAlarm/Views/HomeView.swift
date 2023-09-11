//
//  HomeView.swift
//  crazyAlarm
//
//  Created by dani prayogi on 10/09/23.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = HomeViewModel()
    @State var dummy = dummyItems
    
    var body: some View {
        NavigationView{
            VStack{
                List(dummyItems) { alarm in
                    AlarmItemView(item: alarm).swipeActions{
                        Button("Delete") {
                            viewModel.delete(id: alarm.id)
                        }
                        .tint(.red)
                        Button("Edit") {
                            viewModel.selectedItem = alarm
                            viewModel.showingChangeAlarm = true
                        }
                        .tint(.blue)
                    }
                }
            }
            .navigationTitle("Crazy Alarm")
            .toolbar{
                Button{
                    viewModel.showingChangeAlarm = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingChangeAlarm) {
                ChangeAlarmView(
                    changeItemPresented: $viewModel.showingChangeAlarm,
                    selectedItem: viewModel.selectedItem
                )
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
