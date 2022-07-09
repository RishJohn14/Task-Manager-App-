//
//  AddItemViewModel.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 28/6/22.
//

import Foundation

class AdditemViewModel: ObservableObject
{
    @Published var title:String = ""
    
    
    func canSave()->Bool
    {
        if title.isEmpty
        {
            return false
        }
        else if title.count<5
        {
            return false
        }
        return true
    }
    
    
    func getTodo(id: String = UUID().uuidString) -> TodDoModel
    {
        return TodDoModel(id: id, title: title, isCompleted: false)
    }
}

