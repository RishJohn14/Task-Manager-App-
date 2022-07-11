//
//  Test.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 28/6/22.
//

import SwiftUI

struct Test: View {
    
    @State var isNavigationBarHidden = true
    
    var body: some View {
        NavigationView
        {
            ScrollView
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
                                    Text("22")
                                        .font(.system(size: 70))
                                        .bold()
                                        .padding(.leading)
                                    
                                    Text("Days to next Due Date")
                                        .font(.system(size: 18))
                                        .bold()
                                        .padding(.leading)
                                }
                                Spacer()
                                Image("Stopwatch")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .padding(.trailing,29)
                            
                            }
                            .padding(.leading, 10)
                        
                        Middle()
                        
                        Spacer(minLength: 100)
                        
                         
                    }
                    
                }
                
            }
            
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
        
    }
    
    
    func Middle() -> some View
    {
        ZStack
        {
            GeometryReader
            {geo in
                Rectangle()
                .foregroundColor(.red)
                .opacity(0.3)
                .cornerRadius(10)
                .frame(width: geo.size.width, height: geo.size.height * 3 , alignment: .center)
            
                Text("Test")
            }
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
                
                VStack(alignment: .leading,spacing: 0)
                {
                    Text("Welcome Back!")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .bold()
                    HStack
                    {
                        Text("You are on a X Day Streak")
                        .foregroundColor(.white)
                        .font(.headline)
                        Spacer()
                        Image("Hands")
                            .resizable()
                            .frame(width:60, height:55)
                            .padding(.bottom)
                    }
                    
                }
                .padding(.horizontal)
                
                
                
            }
            
        }
        .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height/5)
    }
           
    func Footer() -> some View
    {
        HStack (spacing:0)
        {
            Image("AccountIcon")
                .resizable()
                .frame(width: 70, height: 50, alignment: .leading)
            
            Text("Rishabh")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .bold()
            
            Spacer()
        }
        .padding(.leading, 20)
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
