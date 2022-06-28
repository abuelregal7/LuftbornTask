//
//  ConcurrentQueue.swift
//  LuftbornTask
//
//  Created by Ahmed on 6/28/22.
//

import Foundation

//MARK:- ConcurrentQueue
class ConcurrentQueue {
    
    typealias Task = () -> ()
    private var tasks: [Task] = []
    private let serialQueue = DispatchQueue(label: "Serial queue")
    
    // to enqueue task and make append
    func enqueueTask(_ task: @escaping Task) {
        serialQueue.sync {
            tasks.append(task)
        }
    }
    
    // to run tasks and remove all tasks
    func runAndRemoveAllTasks() {
        serialQueue.sync {
            tasks.forEach { task in
                task()
            }
            tasks.removeAll()
        }
    }
}
