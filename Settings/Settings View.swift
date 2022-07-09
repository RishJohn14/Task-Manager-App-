//
//  Settings View.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 28/6/22.
//

import SwiftUI


struct SettingsView: View {
    @Binding var firstName:String
    @Binding var lastName:String
    @State var genderchoice = 0
    @State var birthday = Date()
    @State var editable = false
    @State var tog = 0
    @State var img = "rectangle.and.pencil.and.ellipsis"
    var body: some View {
        NavigationView
        {
            
            Form
            {
                Section(header: Text("Personal Information")) {
                    TextField(firstName, text: $firstName)
                    TextField(lastName, text: $lastName)
                    DatePicker("Date of Birth", selection: $birthday, displayedComponents: .date)
                    HStack
                    {
                        Text("Gender: ")
                        Picker(selection: $genderchoice) {
                            Text("Male").tag(0)
                            Text("Female").tag(1)
                        } label: {
                            Text("Gender")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                  }
//                }
//                Section(header: Text("Actions")) {
//                    Toggle("Send Newsletter", isOn: $isNewsletter)
//                        .toggleStyle(SwitchToggleStyle(tint: .red))
//                }
//
//                Stepper("Number of Likes", value: $likes, in: 1...100)
//                Text("This video has \(likes) likes")
            }
            .disabled(editable == false)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideskeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    Button {
                        
                        if tog == 0
                        {
                           tog = 1
                           editable = true
                           img = "checkmark.circle.fill"
                        }
                        else
                        {
                            tog = 0
                            editable = false
                            img = "rectangle.and.pencil.and.ellipsis"
                        }
                        
                    } label: {
                        Image(systemName: img)
                    }


                }
            }
            .navigationTitle("Profile")
        }
        .accentColor(.red)
        
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}

#if canImport(UIKit)
extension View{
    func hideskeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

