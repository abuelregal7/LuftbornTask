//
//  ConcurrentQueue.swift
//  LuftbornTask
//
//  Created by Ahmed on 6/28/22.
//

import Foundation

class ConcurrentQueue {
    
    typealias Task = () -> ()
    private var tasks: [Task] = []
    private let serialQueue = DispatchQueue(label: "Serial queue")
    
    func enqueueTask(_ task: @escaping Task) {
        serialQueue.sync {
            tasks.append(task)
        }
    }
    
    func runAndRemoveAllTasks() {
        serialQueue.sync {
            tasks.forEach { task in
                task()
            }
            tasks.removeAll()
        }
    }
}
