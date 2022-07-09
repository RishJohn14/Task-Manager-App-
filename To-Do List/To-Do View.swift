//
//  To-Do View.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 28/6/22.
//

import SwiftUI


struct To_Do_View: View {
    
    init()
    {
        UITableView.appearance().backgroundColor = UIColor(red: 248/255, green: 193/255, blue: 193/255, alpha: 1)
    }
    
    @StateObject var todoListVM =  ToDoListViewModel()
    
    var body: some View {
        
            List
            {
                
                ForEach(todoListVM.todoList){item in
                    
                    ToDoListRowView(todo:item, onCompletedToggle: {
                        todoListVM.updateItem(item: item.onCompletedToggle())
                    })
                    
                    
                }
                .onDelete(perform: todoListVM.onDelete)
                    .onMove(perform: todoListVM.onMove)
                    
            }
            .navigationTitle("Daily To Do List")
            .overlay(alignment: .topLeading, content: {
                HStack
                {
                    EditButton()
                    
                    Spacer()
                    
                    NavigationLink {
                        AddItemView{todo in
                            todoListVM.onSave(item: todo)
                        }
                    } label: {
                        Text("Add Item")
                    }

                }
                .padding(.horizontal,20)
            })
        }
        
//
//                .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: {
//                    AddItemView { todo in
//                        todoListVM.onSave(item: todo)
//                    }
//                }, label: {
//                    Text("Add Item")
//                }))
      
    
}

struct To_Do_View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView
        {
            To_Do_View()
        }
    }
}

