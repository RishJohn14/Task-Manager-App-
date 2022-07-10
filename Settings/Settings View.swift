//
//  Settings View.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 28/6/22.
//

import SwiftUI


struct SettingsView: View {
    @State var last:String = UserDefaults.standard.string(forKey: "LAST_KEY") ?? ""
    @State var first:String = UserDefaults.standard.string(forKey: "FIRST_KEY") ?? ""
    @State var gender:Int = UserDefaults.standard.integer(forKey: "GENDER_KEY")
    @State var bday:Date = UserDefaults.standard.object(forKey: "DATE_KEY") as? Date ?? Date()
    
    @Binding var displayName:String
    
    @State var editable = false
    @State var tog = 0
    @State var img = "rectangle.and.pencil.and.ellipsis"
    
    let dateRange : ClosedRange<Date> = {
        let pastlimit = Calendar.current.date(byAdding: .year, value: -80, to: Date())!
        let today = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        return pastlimit...today
        
    }()
    var body: some View {
        NavigationView
        {
            
            Form
            {
                Section(header: Text("Personal Information")) {
                    TextField(first, text: $first)
                    TextField(last, text: $last)
                    
                    DatePicker("Date of Birth", selection: $bday,in: dateRange, displayedComponents: .date)
                    HStack
                    {
                        Text("Gender: ")
                        Picker(selection: $gender) {
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
                            UserDefaults.standard.set(last, forKey: "LAST_KEY")
                            UserDefaults.standard.set(first, forKey: "FIRST_KEY")
                            UserDefaults.standard.set(gender, forKey: "GENDER_KEY")
                            UserDefaults.standard.set(bday, forKey: "DATE_KEY")
                            displayName = first
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

