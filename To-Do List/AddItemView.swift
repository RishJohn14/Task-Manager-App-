//
//  AddItemView.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 28/6/22.
//

import SwiftUI

struct AddItemView: View {
    @Environment (\.presentationMode) var presentationMode
    @StateObject var additemVM = AdditemViewModel()
    let onSave: (_ todo:TodDoModel) -> Void
    let id:String = UUID().uuidString
    
    var body: some View {
        ZStack
        {
            Color(red: 248/255, green: 193/255, blue: 193/255)
                .ignoresSafeArea()
            
            
            VStack
            {
                ScrollView
                {
                    TextField("To Do ", text: $additemVM.title)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(12)
                        .onSubmit {
                            onSaveClick()
                            
                        }
                    
                    
                }
                
                Button {
                    if additemVM.canSave()
                    {
                        onSaveClick()
                        
                    }
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:56)
                        .frame(maxWidth: .infinity)
                        .background(.primary)
                        .cornerRadius(12)
                    
                    
                }


            }.padding()
                .navigationTitle("Add Item")
        }
    }
    
    func onSaveClick()
    {
        let todo: TodDoModel = additemVM.getTodo(id: id)
        onSave(todo)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddItemView { todo in
                
            }
        }
    }
}

