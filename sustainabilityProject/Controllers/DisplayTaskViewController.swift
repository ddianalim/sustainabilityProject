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
    var message: String = ""
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskPointValueLabel: UILabel!
    @IBOutlet weak var taskDescriptionTextView: UITextView!
    
    @IBAction func addPointsButtonTapped(_ sender: UIButton) {
        if let task = task {
            totalPoints += task.pointValue
            message = "+ " + String(task.pointValue) + " points!"
        }
            print(totalPoints)
        
            let alertController = UIAlertController(title: nil, message:
                message, preferredStyle: UIAlertControllerStyle.alert)
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
            taskPointValueLabel.text = "+ " + String(task.pointValue) + " points"
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
            let destination = segue.destination as! ListTasksTableViewController
            destination.totalPointLabel.text = "You have: " + String(totalPoints) + " points"
            destination.totalPoints = totalPoints
            
        default:
            print("This is an unexpected segue identifier")
        }
    }
    
}

