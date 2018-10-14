//
//  DisplayTaskViewController.swift
//  sustainabilityProject
//
//  Created by Diana Lim on 10/13/18.
//  Copyright © 2018 Diana Lim. All rights reserved.
//

import UIKit

class DisplayTaskViewController: UIViewController {
    
    var task: Task?
    var totalPoints: Int = 0
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskPointValueLabel: UILabel!
    @IBOutlet weak var taskDescriptionTextView: UITextView!
    
    @IBAction func addPointsButtonTapped(_ sender: UIButton) {
            totalPoints += 5
            print(totalPoints)
            let alertController = UIAlertController(title: nil, message:
                "You gained 5 points!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let task = task {
            taskTitleLabel.text = task.title
            taskPointValueLabel.text = "+ " + task.pointValue + " points"
            taskDescriptionTextView.text = task.description
        } else {
            taskTitleLabel.text = "Title"
            taskPointValueLabel.text = "_ points"
            taskDescriptionTextView.text = "Description of task..."
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "done":
            print("done bar button item tapped")
//            guard let indexPath = tableView.indexPathForSelectedRow else { return }
//
//            let task = tasks[indexPath.row]
            let destination = segue.destination as! ListTasksTableViewController
            let totalPointsString = String(totalPoints)
            
            destination.totalPointLabel.text = "You have: " + totalPointsString + " points"
            
            
            
        default:
            print("This is an unexpected segue identifier")
        }
    }
    
}

