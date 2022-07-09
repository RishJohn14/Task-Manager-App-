//
//  AddNewTask.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 22/6/22.
//

import SwiftUI

struct AddNewTask: View {
    
    @EnvironmentObject var taskModel: TaskViewModel
    
    //MARK: All Environment Values in one Variable
    @Environment (\.self) var env
    @Namespace var animation
    
    var body: some View {
        
        VStack(spacing:12){
            Text("Edit Task")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    
                    Button {
                        
                        env.dismiss()
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }

                }
                .overlay(alignment: .trailing) {
                    
                    Button {
                        
                        if let editTask = taskModel.editTask
                        {
                            env.managedObjectContext.delete(editTask)
                            try? env.managedObjectContext.save()
                            env.dismiss()
                        }
                        
                    } label: {
                        Image(systemName: "trash")
                            .font(.title3)
                            .foregroundColor(.red)
                    }
                    .opacity(taskModel.editTask == nil ? 0:1)

                }
            
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Task Color")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // MARK: Sample Card Colors
                
                //let colors:[String] = ["Yellow","Green","Blue","Purple","Red","Orange"]
                
                let alt:[Int] = [1,2,3,4,5,6]
                HStack(spacing:15){
                    ForEach(alt,id: \.self){index in
                        if index == 1
                        {
                            Circle()
                                .fill(.yellow)
                                .frame(width: 25, height: 25)
                                .background{
                                    if taskModel.taskColor == "Yellow"{
                                        Circle()
                                            .strokeBorder(.gray)
                                            .padding(-3)
                                    }
                                }
                                .contentShape(Circle())
                                .onTapGesture {
                                    taskModel.taskColor = "Yellow"
                                }
                        }
                        else if index == 2
                        {
                            Circle()
                                .fill(.green)
                                .frame(width: 25, height: 25)
                                .background{
                                    if taskModel.taskColor == "Green"{
                                        Circle()
                                            .strokeBorder(.gray)
                                            .padding(-3)
                                    }
                                }
                                .contentShape(Circle())
                                .onTapGesture {
                                    taskModel.taskColor = "Green"
                                }
                            
                        }
                        else if index == 3
                        {
                            Circle()
                                .fill(.blue)
                                .frame(width: 25, height: 25)
                                .background{
                                    if taskModel.taskColor == "Blue"{
                                        Circle()
                                            .strokeBorder(.gray)
                                            .padding(-3)
                                    }
                                }
                                .contentShape(Circle())
                                .onTapGesture {
                                    taskModel.taskColor = "Blue"
                                }
                        }
                        else if index == 4
                        {
                            Circle()
                                .fill(.purple)
                                .frame(width: 25, height: 25)
                                .background{
                                    if taskModel.taskColor == "Purple"{
                                        Circle()
                                            .strokeBorder(.gray)
                                            .padding(-3)
                                    }
                                }
                                .contentShape(Circle())
                                .onTapGesture {
                                    taskModel.taskColor = "Purple"
                                }
                        }
                        else if index == 5
                        {Circle()
                                .fill(.red)
                                .frame(width: 25, height: 25)
                                .background{
                                    if taskModel.taskColor == "Red"{
                                        Circle()
                                            .strokeBorder(.gray)
                                            .padding(-3)
                                    }
                                }
                                .contentShape(Circle())
                                .onTapGesture {
                                    taskModel.taskColor = "Red"
                                }
                            
                        }
                        else
                        {Circle()
                                .fill(.orange)
                                .frame(width: 25, height: 25)
                                .background{
                                    if taskModel.taskColor == "Orange"{
                                        Circle()
                                            .strokeBorder(.gray)
                                            .padding(-3)
                                    }
                                }
                                .contentShape(Circle())
                                .onTapGesture {
                                    taskModel.taskColor = "Orange"
                                }
                            
                        }
                    }
                }
                .padding(.top,10)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top,30)
            
            Divider()
                .padding(.vertical,10)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Task Deadline")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(taskModel.taskDeadline.formatted(date: .abbreviated, time: .omitted) + "," + taskModel.taskDeadline.formatted(date: .omitted, time: .shortened))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.top,10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(alignment: .bottomTrailing) {
                Button {
                    taskModel.showDatePicker.toggle()
                } label: {
                    Image(systemName: "calendar")
                        .foregroundColor(.black)
                    
                }

            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Task Title")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                TextField("",text: $taskModel.taskTitle)
                    .frame(maxWidth: .infinity)
                    .padding(.top,10)
            }
            .padding(.top,10)
            
            Divider()
            
            // MARK: Sample Task Types
            
            let taskTypes = ["Basic","Urgent","Important"]
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Task Type")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                
                HStack(spacing: 12){
                    ForEach(taskTypes, id:\.self){type in
                        Text(type)
                            .font(.callout)
                            .foregroundColor(taskModel.taskType == type ? .white:.black)
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity)
                            .background
                            {
                                if taskModel.taskType == type
                                {
                                    Capsule()
                                        .fill(.black)
                                        .matchedGeometryEffect(id: "TYPE", in: animation)
                                }
                                else{
                                    Capsule()
                                        .strokeBorder(.black)
                                }
                            
                            }
                            .contentShape(Capsule())
                            .onTapGesture {
                                withAnimation{
                                    taskModel.taskType = type
                                }
                            }
                    }
                    
                }
                .padding(.top,8)
            }
            .padding(.vertical,10)
            
            Divider()
            
            //MARK: Save Button
            
            Button {
                // MARK: If success Closing View
                if taskModel.addTask(context: env.managedObjectContext)
                {
                    env.dismiss()
                }
                
            } label: {
                Text("Save Task")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,12)
                    .foregroundColor(.white)
                    .background
                    {
                        Capsule()
                            .fill(.black)
                    }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom,10)
            .disabled(taskModel.taskTitle == "")
            .opacity(taskModel.taskTitle == "" ? 0.6 : 1)

        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        .overlay {
            ZStack
            {
                if taskModel.showDatePicker

                {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                        .onTapGesture {
                            taskModel.showDatePicker = false
                        }
                    
                    DatePicker.init("", selection: $taskModel.taskDeadline,in:
                                        Date.now...Date.distantFuture)
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .padding()
                        .background(.white, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .padding()
                    
                }
            }
            .animation(.easeInOut, value: taskModel.showDatePicker)
        }
    }
}

struct AddNewTask_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTask().environmentObject(TaskViewModel())
    }
}
