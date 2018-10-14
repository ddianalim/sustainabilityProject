//
//  ListTasksTableViewController.swift
//  sustainabilityProject
//
//  Created by Diana Lim on 10/13/18.
//  Copyright © 2018 Diana Lim. All rights reserved.
//

import UIKit

class ListTasksTableViewController: UITableViewController {
    
    var tasks1 = ["Reusable Bottle","Reusable Bag","Reusable Drink Container", "Packed Lunch", "Reusable Leftover Container", "Reusable straw/No straw", "Reusable Utensils", "Paperless Receipts"]
    
    var points = ["5", "10", "15", "20", "_", "5", "5", "5"]
    
    var tasks = [Task]()
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return tasks1.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTasksTableViewCell", for: indexPath) as! ListTasksTableViewCell
        for _ in 0..<tasks1.count{
            cell.taskTitleLabel.text = tasks1[indexPath.row]
            cell.taskPointValuelabel.text = points[indexPath.row]+" points"
        }
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
 
        switch identifier {
        case "displayTask":
            print("Transitioning to the Display Task View Controller")
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            // 2
            let task = tasks[indexPath.row]
            // 3
            let destination = segue.destination as! DisplayTaskViewController
            // 4
            destination.task = task
            
        case "done":
            print("done bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
}

