//
//  Task.swift
//  ToDoList90
//
//  Created by Ankitha Ralla on 2025-02-28.
//

import Foundation

struct Task: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var dueDate: Date
    var isCompleted: Bool = false
}
