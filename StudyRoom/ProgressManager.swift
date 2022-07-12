//
//  ProgressManager.swift
//  TaskManager
//
//  Created by Rishabh Alexander John on 12/7/22.
//

import Foundation
enum timerstate {
    case notStarted
    case studying
}

class progressmanager : ObservableObject {
    
    @Published private(set) var timerstate: timerstate = .notStarted
    
    @Published private(set) var startTime:Date
    @Published private(set) var endTime:Date
    func togglestate(){
        timerstate = timerstate == .notStarted ? .studying : .notStarted
    }
    init()
    {
        let calendar = Calendar.current
        
        let components = DateComponents()
        
        let scheduledTime = calendar.nextDate(after: .now, matching: components, matchingPolicy: .nextTime)!
        startTime = scheduledTime
        endTime = scheduledTime.addingTimeInterval(20)
    }
}
