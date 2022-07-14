//
//  Ring.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 12/7/22.
//

import SwiftUI

//let defaultTimeRemaining : CGFloat = 10
let lineWidth: CGFloat = 20
let radius:CGFloat = 70

struct Ring: View {
    
    @State private var isActive = false
    var defaultTimeRemaining:CGFloat
    @State var timeRemaining: CGFloat
    
    let timer = Timer
                   .publish(every: 1, on: .main, in: .common)
                   .autoconnect()
    
    var body: some View {
        VStack(spacing: 45){
            ZStack
            {
                Circle()
                    .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                
                Circle()
                    .trim(from:0, to: ((defaultTimeRemaining-timeRemaining)/defaultTimeRemaining))
                    .stroke(AngularGradient(gradient: Gradient(colors: [.white]), center: .center), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .opacity(0.7)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                
                Text("\(Int(Double((defaultTimeRemaining-timeRemaining)/defaultTimeRemaining)*100))% ")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .frame(width: 250, height: 250)
            
            Text("")
            Text("")
            Text("")
            HStack(spacing:25)
            {
                Label("\(isActive ? "Pause":"Go!")", systemImage: "\(isActive ? "pause.fill":"play.fill")")
                    .foregroundColor(.white)
                    .font(.title)
                    .onTapGesture {
                        isActive.toggle()
                    }
                
                Label("Reset", systemImage: "backward.fill")
                    .foregroundColor(.white)
                    .font(.title)
                    .onTapGesture {
                        isActive = false
                        timeRemaining = defaultTimeRemaining
                    }
            }
        }
        .onReceive(timer) { time in
            guard isActive else {return}
            
            if timeRemaining > 0
            {
                timeRemaining -= 1
            }
            else
            {
                isActive = false
                timeRemaining = defaultTimeRemaining
            }
        }
        
    }
    
    
}


struct Ring_Previews: PreviewProvider {
    static var previews: some View {
        Ring(defaultTimeRemaining: 15, timeRemaining: 15)
    }
}
