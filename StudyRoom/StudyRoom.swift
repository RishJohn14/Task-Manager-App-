//
//  StudyRoom.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 12/7/22.
//

import SwiftUI

struct StudyRoom: View {
    @State var choice = 0
    //@State var time:Int = 15
    @State var showview:Bool = false
    
    var body: some View {
        
        NavigationView
        {
                GeometryReader
                {geo in
                    ZStack
                   {
                       Image("BG")
                        .resizable()
                        .ignoresSafeArea()
                       
                       VStack(spacing:35)
                       {
                           
                           Text("Study Room")
                               .foregroundColor(.white)
                               .font(.system(size: 32))
                               .font(.title)
                               .bold()
                           Text("")
                           
                          
                           
                           Group
                           {
                               Picker("Title", selection: $choice) {
                                   Text("15 mins").tag(0).foregroundColor(.white)
                                   Text("30 mins").tag(1).foregroundColor(.white)
                                   Text("45 mins").tag(2).foregroundColor(.white)
                                   Text("1 hr").tag(3).foregroundColor(.white)
                                   Text("1hr 15mins").tag(4).foregroundColor(.white)
                                   Text("1hr 30mins").tag(5).foregroundColor(.white)
                                   Text("1hr 45mins").tag(6).foregroundColor(.white)
                                   Text("2 hrs").tag(7).foregroundColor(.white)
                                   
                               }.pickerStyle(InlinePickerStyle())
                               
                                   NavigationLink {
                                       ProgressRoom(tog: choice)
                                   } label: {
                                       Text("Set Time")
                                       .foregroundColor(.black)
                                       .font(.title3)
                                       .kerning(1)
                                       .fontWeight(.semibold)
                                       .padding()
                                       .background {
                                           Capsule()
                                               .fill(.white)
                                               .opacity(0.8)
                                       }
                                   }
                               
                           }
                           
                           
                           Spacer()
                        }
                        
                   }
                
            
        }
            
        }
    }
}

struct StudyRoom_Previews: PreviewProvider {
    static var previews: some View {
        StudyRoom()
    }
}
