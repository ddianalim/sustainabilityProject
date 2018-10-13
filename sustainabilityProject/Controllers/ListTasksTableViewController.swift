//
//  ListTasksTableViewController.swift
//  sustainabilityProject
//
//  Created by Diana Lim on 10/13/18.
//  Copyright © 2018 Diana Lim. All rights reserved.
//

import UIKit

class ListTasksTableViewController: UITableViewController {
    
    
    var tasks = ["Reusable Bottle","Reusable Bag","Reusable Drink Container", "Packed Lunch", "Reusable Leftover Container", "Reusable straw/No straw", "Reusable Utensils", "Paperless Receipts"]
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTasksTableViewCell", for: indexPath) as! ListTasksTableViewCell
        for _ in 0..<tasks.count{
            cell.taskTitleLabel.text = tasks[indexPath.row]
        }
//        cell.taskTitleLabel.text = "task's title"
        cell.taskPointValuelabel.text = "task's point value"
        
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // 1
//        guard let identifier = segue.identifier else { return }
//
//        // 2
//        if identifier == "displayNote" {
//            print("Transitioning to the Display Note View Controller")
//        }
//    }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "done":
            print("done bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
}

