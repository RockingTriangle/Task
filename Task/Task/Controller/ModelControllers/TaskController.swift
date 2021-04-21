//
//  TaskController.swift
//  Task
//
//  Created by Mike Conner on 4/21/21.
//

import Foundation

class TaskController {
    
    //MARK: - Properties
    static let shared = TaskController()
    var tasks: [Task] = []
    
    //MARK: - Methods
    ///CRUD
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let newTask = Task(name: name)
        if let notes = notes {
            newTask.notes = notes
        }
        if let dueDate = dueDate {
            newTask.dueDate = dueDate
        }
        tasks.append(newTask)
        saveToPersistenceStore()
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        if let notes = notes {
            task.notes = notes
        }
        if let dueDate = dueDate {
            task.dueDate = dueDate
        }
        saveToPersistenceStore()
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        saveToPersistenceStore()
    }
    
    func delete(task: Task) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks.remove(at: index)
        saveToPersistenceStore()
    }
    
    //MARK: - Persistance
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Tasks.json")
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: createPersistenceStore())
        } catch {
            print("Error encoding tasks:  \(error)")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            tasks = try JSONDecoder().decode([Task].self, from: data)
        } catch {
            print("Error decoding tasks:  \(error)")
        }
    }
} //End of class
