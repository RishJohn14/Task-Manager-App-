//
//  ProgressRoom.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 12/7/22.
//

import SwiftUI

struct ProgressRoom: View {
    @State var tog: Int
    
    var body: some View {
            GeometryReader
            {geo in
                ZStack
               {
                   let time = calc(choice: tog)
                   
                   Image("BG")
                    .resizable()
                    .ignoresSafeArea()
                   
                   VStack(spacing:50)
                   {
                       
                       Text("Study Room")
                           .foregroundColor(.white)
                           .font(.system(size: 32))
                           .font(.title)
                           .bold()
                       
                       Text("Study Plan: \(time) mins")
                           .foregroundColor(.white)
                       
                       
                       Ring(defaultTimeRemaining: CGFloat(time*60), timeRemaining: CGFloat(time*60))
                       
                       Spacer()
                       

                    }
                    
               }
            }
        }
    
}

func calc(choice: Int)->Int
{
    if choice == 0
    {
        return 15
    }
    else if choice == 1
    {
        return 30
    }
    else if choice == 2
    {
        return 45
    }
    else if choice == 3
    {
        return 60
    }
    else if choice == 4
    {
        return 75
    }
    else if choice == 5
    {
        return 90
    }
    else if choice == 6
    {
        return 105
    }
    else
    {
        return 120
    }
    
}


struct ProgressRoom_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRoom(tog: 1)
    }
}
