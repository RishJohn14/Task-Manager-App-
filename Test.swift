//
//  Test.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 28/6/22.
//

import SwiftUI

struct Test: View {
    //@EnvironmentObject var progmanager : progressmanager
    @State var progress = 0.0
    var body: some View {
        ZStack
        {
            Color(.black)
                .ignoresSafeArea()
            ZStack
            {
                
                //Outer Ring
                Circle()
                    .stroke(lineWidth: 20)
                    .foregroundColor(.black)
                    .opacity(0.5)
                
                //Coloured Ring
                
                Circle()
                    .trim(from: 0.0, to: min(progress,1.0))
                    .stroke(AngularGradient(gradient: Gradient(colors: [.white]), center: .center),style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                    .opacity(0.7)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut(duration: 1.0), value: progress)
                
                
                VStack(spacing:30)
                {
                    VStack(spacing:5)
                    {
                        Text("Elapsed Time")
                            .opacity(0.8)
                            .foregroundColor(.white)
                        
                        Text("0:00")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    .padding(.top)
                    VStack(spacing:5)
                    {
                        Text("Remaining Time")
                            .opacity(0.8)
                            .foregroundColor(.white)
                        
                        Text("0:00")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    
                }
             }
            .frame(width: 250, height: 250, alignment: .center)
            .padding()
            .onAppear
            {
                progress = 1
            }
        }
        
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
