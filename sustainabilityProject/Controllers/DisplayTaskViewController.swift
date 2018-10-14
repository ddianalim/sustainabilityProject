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
    
//    var task: Task

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taskTitleLabel.text = "self.task.title"
        taskPointValueLabel.text = "self.task.pointValue"
        taskDescriptionTextView.text = "self.task.description"
//        taskTitleLabel.text = self.task.title
//        taskPointValueLabel.text = self.task.pointValue
//        taskDescriptionTextView.text = self.task.description
    }
    
}

