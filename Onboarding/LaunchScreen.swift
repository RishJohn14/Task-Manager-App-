//
//  LaunchScreen.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 10/7/22.
//

import SwiftUI

struct LaunchScreen: View {
    
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        WalkthroughScreen()
        
        //if currentPage > totalPages then call Home()
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}

struct HomeFake : View
{
    var body: some View
    {
        Text("Welcome to Home")
            .font(.title)
            .fontWeight(.heavy)
    }
}

struct WalkthroughScreen : View
{
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View
    {
        ZStack{
            if currentPage == 1
            {
                
                ScreenView(image: "First", title: "First Screen", details: "Trial Test 1",BG: Color(red: 56/255, green: 204/255, blue: 153/255))
                    .transition(.scale)
            }
            else if currentPage == 2
            {
                ScreenView(image: "Second", title: "Second Screen", details: "Trial Test 2", BG: Color(red: 53/255, green: 101/255, blue: 254/255))
                    .transition(.scale)
            }
            else if currentPage == 3
            {
                ScreenView(image: "Third", title: "Third Screen", details: "Trial Test 3", BG:Color(red: 237/255, green: 140/255, blue: 55/255))
                    .transition(.scale)
            }
            else
            {
                //
            }
            
        }
        .overlay(alignment:.bottom) {
            
            Button {
                withAnimation(.easeInOut){
                  
                    if currentPage < totalPages
                    {
                        currentPage += 1
                    }
                    else
                    {
                        currentPage = 1
                        
                    }
                }
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20,weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width:60, height:60)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay {
                        
                        ZStack
                        {
                            Circle()
                                .stroke(Color.black.opacity(0.04), lineWidth: 4)
                                
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage)/CGFloat(totalPages))
                                .stroke(Color.white,lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-15)
                    }
            }
            .padding(.bottom)

        }
    }
}

struct ScreenView: View {
    
    var image:String
    var title :String
    var details:String
    var BG : Color
    
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        VStack(spacing:20)
        {
            HStack
            {
                if currentPage == 1
                {
                    Text("Hello Member")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.3)
                }
                else
                {
                    Button {
                        withAnimation(.easeInOut)
                        {
                            currentPage -= 1
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(10)
                    }

                }
                //Modifier used for letter spacing
                
                Spacer()
                
                Button {withAnimation(.easeInOut)
                    {
                        currentPage = 4
                    }
                } label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                }
                .foregroundColor(.black)
                
            }
            .padding()
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
                .padding(.bottom,60)
                .padding(.leading)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top)
            
            Text(details)
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            Spacer(minLength: 120)
        }
        .background(BG.cornerRadius(10).ignoresSafeArea())
    }
}

var totalPages = 3
