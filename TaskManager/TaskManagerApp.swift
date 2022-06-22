//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 22/6/22.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
