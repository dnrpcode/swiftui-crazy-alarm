//
//  ChangeAlarmView.swift
//  crazyAlarm
//
//  Created by dani prayogi on 11/09/23.
//

import SwiftUI

struct ChangeAlarmView: View {
    @StateObject var viewModel: ChangeAlarmViewModel
    @Binding var changeItemPresented: Bool
    let typeAlarmArray = TypeAlarm.allCases
    
    init(changeItemPresented: Binding<Bool>, selectedItem: AlarmItem?) {
        _changeItemPresented = changeItemPresented
        self._viewModel = StateObject(wrappedValue: ChangeAlarmViewModel(data: selectedItem))
    }
    
    var body: some View {
        VStack{
            Text(viewModel.titleHeader)
                .font(.system(size: 32))
                .bold()
                .padding(.top, 20)
            
            Form{
                Section(header: Text("Alarm Details")) {
                    Toggle("Status", isOn: $viewModel.status)
                    TextField("Title", text: $viewModel.title)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Description", text: $viewModel.title)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
                
                Section(header: Text("Alarm Type")) {
                    Picker("Select a color", selection: $viewModel.type) {
                        ForEach(TypeAlarm.allCases, id: \.self) { type in
                            Text(type.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
//                Section(header: Text("Ringtone")) {
//                    Picker("Ringtone Type", selection: $viewModel.ringtone) {
//                        ForEach(RingtoneType.allCases) { ringtoneType in
//                            Text(ringtoneType.description).tag(ringtoneType)
//                        }
//                    }
//                    .pickerStyle(.segmented)
//                }
                
                Section(header: Text("Recurrence Days")) {
                    ForEach(Day.allCases, id: \.self) { day in
                        Toggle(day.rawValue.capitalized, isOn: Binding(
                            get: { viewModel.days?.contains(day) ?? false },
                            set: { isOn in
                                if isOn {
                                    viewModel.days?.append(day)
                                } else {
                                    viewModel.days?.removeAll { $0 == day }
                                }
                            }
                        ))
                    }
                }
                
                Button{
                    if viewModel.canSave {
                        viewModel.save()
                        changeItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                } label: {
                    Text("Save Alarm")
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all field and select due date that is today or newer.")
                )
            }
        }
    }
}

struct ChangeAlarmView_Previews: PreviewProvider {
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
        
        let newItemPresented = Binding.constant(false)
        
        return ChangeAlarmView(
            changeItemPresented: newItemPresented,
            selectedItem: dummyItem
        )
    }
}
