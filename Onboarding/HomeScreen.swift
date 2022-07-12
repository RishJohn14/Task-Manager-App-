//
//  HomeScreen.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 28/6/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @State var isSettings = false
    //@State var firstName = "Set Profile Details"
    @State var needsEdit = UserDefaults.standard.bool(forKey: "BOOL_KEY")
    @AppStorage("firstName") var firstName = "Set Profile Details"
    let persistenceController = PersistenceController.shared
    @State var ToDoModel = ToDoListViewModel()
    
    let currentDateTimeInterval = Int(Date().timeIntervalSinceReferenceDate)
    var storedDaysCount:Int = UserDefaults.standard.integer(forKey: "DaysCount")
    let lastTimeinterval = UserDefaults.standard.integer(forKey: "LastTime")
    
    
    var body: some View {
        NavigationView
        {
            ZStack
            {
                Rectangle()
                    .fill(.indigo)
                    .opacity(0.70)
                    .ignoresSafeArea()
                
                
                VStack(spacing: 10)
                {
                    
                    Header()
                    
                    HStack(spacing:5)
                        {
                            VStack(alignment: .leading)
                            {
                                Text(getCurrentTime())
                                    .font(.system(size: 45))
                                    .bold()
                                    .padding(.leading)

                                Text(getDate())
                                    .font(.system(size: 18))
                                    .bold()
                                    .padding(.leading,25)
                            }
                            Spacer()
                            
                            Image(systemName: "calendar.badge.clock")
                                .resizable()
                                .frame(width: 80, height: 75)
                                .padding(.trailing,29)

                        }
                        .padding(.leading, 10)
                    
                    Buttons()
                    
                    Spacer(minLength: 80)
                    
                }
                .overlay(alignment: .bottomLeading, content: {
                    Footer()
                })
                
                    
          }
            .navigationBarTitle("Back")
            .navigationBarHidden(true)
            
        }
            
    }
      
    func Header()->some View
    {
        GeometryReader
        {
            geo in
            
            ZStack
            {
                Rectangle()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .top)
                    .cornerRadius(15)
                    .edgesIgnoringSafeArea(.top)
                
                HStack
                {
                    VStack(alignment: .leading, spacing:10)
                    {
                        Text("  Welcome Back!")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .bold()
                        
                        
                        Text("     Get Started")
                            .foregroundColor(.white)
                            .font(.system(size: 23))
                    }
                    Spacer()
                    Image("Stacks")
                        .resizable()
                        .frame(width: 70, height: 70, alignment: .trailing)
                    
                }
                .padding(.horizontal)
                .padding(.bottom,40)
            }
            
        }
        .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height/5)
    }
    
    func getCurrentTime() -> String
    {
        let formatter = DateFormatter()
        
        formatter.timeStyle = .short
        let timeString = formatter.string(from: Date())
        return timeString
    }
    
    func getDate()->String
    {
        let formatter = DateFormatter()
        
        formatter.dateStyle = .full
        let datestring = formatter.string(from: Date())
        return datestring
    }
    
    func Buttons() -> some View
    {
            VStack(spacing:0)
            {
                HStack(spacing:35)
                {
                    VStack(spacing:15)
                    {
                        NavigationLink {
                            ContentView()
                                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                            
                        } label: {
                            Image("TaskManager")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .cornerRadius(20)
                        }
                        Text("Task Manager")
                            .font(.headline)
                            .bold()
                    }
                    .padding([.leading, .top],20)
                    
                    VStack(spacing:15)
                    {
                        NavigationLink{
                            To_Do_View(viewModel: ToDoModel)
                        } label: {
                            Image("to do list")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .cornerRadius(20)
                        }
                        
                        Text("To - Do List")
                            .font(.headline)
                            .bold()
                    }
                    .padding([.trailing, .top],20)
                }
                
                HStack(spacing: 35)
                {
                    VStack(spacing:15)
                    {
                        NavigationLink {
                            StudyRoom()
                        } label: {
                            Image("StudyRoom")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .cornerRadius(20)
                        }
                        
                        Text("Study Room")
                            .font(.headline)
                            .bold()
                    }
                    .padding([.leading, .top],20)
                    
                    VStack(spacing:15)
                    {
                        NavigationLink {
                            Calculator()
                        } label: {
                            Image("Calculator")
                                 .resizable()
                                 .frame(width: 150, height: 150)
                                 .cornerRadius(20)
                        }
                        Text("Calculator")
                            .font(.headline)
                            .bold()
                    }
                    .padding([.trailing, .top],20)
                }
            }
        
    }
           
    func Footer() -> some View
    {
        HStack (spacing:0)
        {
            Button{
                isSettings = true
            } label: {
                
                Group
                   {
                       Image("AccountIcon")
                            .resizable()
                            .frame(width: 70, height: 50)
                        
                        Text("\(firstName)")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .bold()
                   }
                
            }
            .sheet(isPresented: $isSettings) {
                SettingsView(displayName: $firstName)
            }
        }
        .padding([.leading],20)
    }
    
    
}




struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
