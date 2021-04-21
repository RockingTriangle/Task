//
//  Task.swift
//  Task
//
//  Created by Mike Conner on 4/21/21.
//

import Foundation

class Task: Codable {
        
    //MARK: - Properties
    let uuid: String
    var name: String
    var notes: String?
    var dueDate: Date?
    var isComplete: Bool
    
    //MARK: - Initializer
    init(uuid: String = UUID().uuidString , name: String, notes: String? = nil, dueDate: Date? = nil, isComplete: Bool = false) {
        self.uuid = uuid
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
} //End of class

//MARK: - Extensions
extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.uuid == rhs.uuid
    }
} //End of extension
