//
//  To-Do View.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 28/6/22.
//

import SwiftUI


struct To_Do_View: View {
    
    @StateObject var todoModel:ToDoListViewModel

    init(viewModel: @autoclosure @escaping() -> ToDoListViewModel)
    {
        _todoModel = StateObject(wrappedValue: viewModel())
        
        UITableView.appearance().backgroundColor = UIColor(red: 248/255, green: 193/255, blue: 193/255, alpha: 1)
    }
    
    var body: some View {
      
            List
            {
                ForEach(todoModel.todoList){item in
                    
                    ToDoListRowView(todo:item, onCompletedToggle: {
                        todoModel.updateItem(item: item.onCompletedToggle())
                    })
                    
                    
                }
                .onDelete(perform: todoModel.onDelete)
                    .onMove(perform: todoModel.onMove)
                    
            }
            .navigationTitle("Daily To Do List")
            
                .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: {
                    AddItemView { todo in
                        todoModel.onSave(item: todo)
                    }
                }, label: {
                    Text("Add Item")
                }))
    }
}

struct To_Do_View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView
        {
            To_Do_View(viewModel: ToDoListViewModel())
        }
    }
}

