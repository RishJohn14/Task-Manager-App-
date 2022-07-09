//
//  ToDoListRowView.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 28/6/22.
//

import SwiftUI
struct ToDoListRowView: View {
    let todo : TodDoModel
    let onCompletedToggle: () -> Void
    var body: some View {
        
        HStack
        {
            Button (action: onCompletedToggle,
                    label: {
                      Image(systemName: todo.isCompleted ? "checkmark.circle":"circle")
                    .foregroundColor(todo.isCompleted ? .green: Color(UIColor.placeholderText))
        })

            Text(todo.title).strikethrough(todo.isCompleted)
            Spacer()
        }
    }
}

struct ToDoListRowView_Previews : PreviewProvider
{
    static var previews: some View{
        
        Group{
            
            ToDoListRowView(todo: TodDoModel(title: "Test item 1", isCompleted: true), onCompletedToggle: {})
            ToDoListRowView(todo: TodDoModel(title: "Test item 2", isCompleted: false),onCompletedToggle: {})
        }.previewLayout(.sizeThatFits)
    }
}
