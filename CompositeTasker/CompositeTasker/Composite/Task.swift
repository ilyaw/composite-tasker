//
//  Task.swift
//  CompositeTasker
//
//  Created by Ilya on 27.06.2021.
//

import Foundation

class Task: TaskProtocol {
    var title: String
    var subTasks: [TaskProtocol] = []
    
    var count: Int { subTasks.count }
    
    init(title: String) {
        self.title = title
    }
    
    func addTask(title: String) {
        subTasks.append(Task(title: title))
    }

    func removeTask(at index: Int) {
        subTasks.remove(at: index)
    }
}
