//
//  ListTasksTableViewController.swift
//  sustainabilityProject
//
//  Created by Diana Lim on 10/13/18.
//  Copyright © 2018 Diana Lim. All rights reserved.
//

import UIKit

class ListTasksTableViewController: UITableViewController {
    
    var tasks = [Task]()
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks.append(Task(title: "Reusable Bottle", pointValue: "5", description: "xxx"))
        tasks.append(Task(title: "Reusable Bag", pointValue: "500", description: "yyy"))
        tasks.append(Task(title: "Reusable", pointValue: "50", description: "zzz"))
        tasks.append(Task(title: "Reusable Bottle", pointValue: "15", description: "iii"))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTasksTableViewCell", for: indexPath) as! ListTasksTableViewCell
        let task = tasks[indexPath.row]
        cell.taskTitleLabel.text = task.title
        cell.taskPointValuelabel.text = task.pointValue
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayNote":
            guard let indexPath = tableView.indexPathForSelectedRow else { return }

            let task = tasks[indexPath.row]
            let destination = segue.destination as! DisplayTaskViewController
            destination.task = task
            
        default:
            print("unexpected segue identifier")
        }
    }

/*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
 
        switch identifier {
        case "displayTask":
            let task = Task()
            task.title = taskTitleLabel.text ?? ""
            task.pointValue = taskPointValueLabel.text ?? ""
            task.description = taskDescriptionTextView.text ?? ""
            print("Transitioning to the Display Task View Controller")

//            guard let indexPath = tableView.indexPathForSelectedRow else { return }
////            let task = tasks[indexPath.row]
//           let destination = segue.destination as! DisplayTaskViewController
//            let task = Task(title:tasks1[indexPath.row], pointValue:points[indexPath.row], description:"something random")
//            destination.task = task
//
        case "done":
            print("done bar button item tapped")
     
        default:
            print("unexpected segue identifier")
        }
    }
    */
}

