//
//  To-Do Model.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 28/6/22.
//

import Foundation


struct TodDoModel:Identifiable
{
    let id:String
    let title:String
    let isCompleted:Bool
    
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool)
    {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func onCompletedToggle() -> TodDoModel
    {
        return TodDoModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
