//
//  TaskProtocol.swift
//  CompositeTasker
//
//  Created by Ilya on 27.06.2021.
//

import Foundation

protocol TaskProtocol {
    var title: String { get set}
    var subTasks: [TaskProtocol] { get set }
}
