//
//  AccountView.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 28/6/22.
//

import SwiftUI


struct AccountView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var genderchoice = 0
    @State var birthday = Date()
    
    var body: some View {
        NavigationView
        {
            
            Form
            {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
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
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hidekeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                          
                    }
                    
                    Button {
                        if (firstName != "" && lastName != "")
                        {
                            //Confirm Save
                        }
                        //
                    } label: {
                        Text("Save")
                    }


                }
            }
            .navigationTitle("Account")
        }
        .accentColor(.red)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}


#if canImport(UIKit)
extension View{
    func hidekeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
