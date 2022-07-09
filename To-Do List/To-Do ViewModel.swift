//
//  To-Do ViewModel.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 28/6/22.
//

import Foundation

class ToDoListViewModel : ObservableObject
{
    @Published var todoList : [TodDoModel] = []
    
    init()
    {
        //todoList.append(contentsOf: [
            
       //     TodDoModel(title: "Item 1", isCompleted: false),
         //   TodDoModel(title: "Item 2", isCompleted: false)
        //])
    }
    
    func onMove(IndexSet: IndexSet, to : Int)
    {
        todoList.move(fromOffsets: IndexSet, toOffset: to)
    }
    
    func onDelete(indexSet: IndexSet)
    {
        todoList.remove(atOffsets: indexSet)
    }
    
    func updateItem(item: TodDoModel)
    {
        if let index = todoList.firstIndex(where: {$0.id == item.id})
        {
            todoList[index] = item
        }
    }
    
    func onSave(item: TodDoModel)
    {
        if let index = todoList.firstIndex(where: {$0.id == item.id})
        {
            todoList[index] = item
            return
        }
        todoList.append(item)
    }
}
