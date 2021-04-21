//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Mike Conner on 4/21/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
} //End of protocol

class TaskTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    weak var delegate: TaskCompletionDelegate?
    var task: Task? {
        didSet {
            updateViews()
        }
    }

    //MARK: - IBOutlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    //MARK: - IBActions
    @IBAction func completionButtonTapped(_ sender: Any) {
        if let delegate = delegate {
            delegate.taskCellButtonTapped(self)
        }
    }
    
    //MARK: - Functions
    func updateViews() {
        guard let task = task else { return }
        taskNameLabel.text = task.name
        completionButton.setBackgroundImage(task.isComplete ? UIImage(named: "complete") : UIImage(named: "incomplete"), for: .normal) 
    }
} //End of class
