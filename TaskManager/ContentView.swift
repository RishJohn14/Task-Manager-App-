//
//  ContentView.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 22/6/22.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView{
            Home()
                .navigationBarTitle("Task Manager")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
