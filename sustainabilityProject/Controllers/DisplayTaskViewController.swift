//
//  DisplayTaskViewController.swift
//  sustainabilityProject
//
//  Created by Diana Lim on 10/13/18.
//  Copyright © 2018 Diana Lim. All rights reserved.
//

import UIKit

class DisplayTaskViewController: UIViewController {
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskPointValueLabel: UILabel!
    @IBOutlet weak var taskDescriptionTextView: UITextView!
    
////    var task: Task
//    for _ in 0..<7{
//        let task = Task()
//        task.title = taskTitleLabel.text ?? ""
//        task.pointValue = taskPointValueLabel.text ?? ""
//        task.description = taskDescriptionTextView.text ?? ""
//
////        let destination = segue.destination as! ListTasksTableViewController
////        destination.tasks.append(task)
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        taskTitleLabel.text = "self.task.title"
//        taskPointValueLabel.text = "self.task.pointValue"
//        taskDescriptionTextView.text = "self.task.description"
        
        let task = Task()
        task.title = taskTitleLabel.text ?? ""
        task.pointValue = taskPointValueLabel.text ?? ""
        task.description = taskDescriptionTextView.text ?? ""
        
//        taskTitleLabel.text = self.task.title
//        taskPointValueLabel.text = self.task.pointValue
//        taskDescriptionTextView.text = self.task.description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "done":
            let task = Task()
            task.title = taskTitleLabel.text ?? ""
            task.pointValue = taskPointValueLabel.text ?? ""
            task.description = taskDescriptionTextView.text ?? ""
            
            let destination = segue.destination as! ListTasksTableViewController
            destination.tasks.append(task)
            
//        case "cancel":
//            print("cancel bar button item tapped")
//
        default:
            print("unexpected segue identifier")
        }
    }
    
}

