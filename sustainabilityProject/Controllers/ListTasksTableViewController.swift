//
//  ListTasksTableViewController.swift
//  sustainabilityProject
//
//  Created by Diana Lim on 10/13/18.
//  Copyright © 2018 Diana Lim. All rights reserved.
//

import Foundation
import UIKit

class ListTasksTableViewController: UITableViewController {
    
    @IBOutlet weak var totalPointLabel: UILabel!
    
    var tasks = [Task]()
    var totalPoints: Int = 0

    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = self.navigationController?.navigationBar

        navBar?.barTintColor = UIColor(red:0.82, green:0.88, blue:0.89, alpha:1.0)
        navBar?.tintColor = UIColor.white
        navBar?.isTranslucent = false
        navBar?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Light", size: 25)!]

        tasks.append(Task(title: "Reuse Bottle", pointValue: 5, description: "Problem: \nGlobally, humans buy a million plastic bottles per minute. 91% of all plastic is not recycled. \n\nSolution: \nPurchase a reusable water bottle and opt to refill it every day instead of buying a single use plastic water bottle. Staying hydrated is incredibly important. Treat your water bottle as if it’s your third hand and don’t ever leave home without it."))
        tasks.append(Task(title: "Reuse Bag", pointValue: 10, description: "Problem: \nAmericans use 100 billion plastic bags a year, and about 365 plastic bags pass through the hands of a single consumer each year. \n\nSolution: \nUse reusable canvas, cloth, or string bags. Set yourself up for success by pre-placing bags all over your home, car and in your school bag for easy access."))
        tasks.append(Task(title: "Reuse Drink Container", pointValue: 15, description: "Problem: \nAmericans throw away 125 billion single use drink cups every year.\n\nSolution: \nBYOC (Bring Your Own Cup). To keep your daily coffee or boba shop trip plastic-free, bring along your own reusable cup, thermos, or mason jar. Be bold and kindly request your drink in your own container!"))
        tasks.append(Task(title: "Pack Lunch", pointValue: 20, description: "Problem: \nIf you go out to eat every day, it can be a very expensive habit. Additionally, eating out will often result in waste in the form of single use napkins, utensils, or dishes.\n\nSolution: \nMake your own lunch at home and pack it into a reusable container."))
        tasks.append(Task(title: "Reuse Leftover Container", pointValue: 20, description: "Problem: \nLeftovers from restaurants often get wasted. Additionally, the packaging of leftovers in disposable to go boxes is extremely wasteful.\n\nSolution: \nWhen you eat out, bring a lightweight container in your bag so you can take home leftovers or things on the go. This solves the problem of food waste as well as the problem of wasted single use to go containers."))
        tasks.append(Task(title: "Reuse straw/No straw", pointValue: 5, description: "Problem: \nAmericans use 500 million straws every day, and these straws can’t be recycled resulting in a lot of trash.\n\nSolution: \nAdopt the phrase “no straw please” when ordering a drink at a bar or glass of water at a restaurant. Or get yourself a reusable option like a stainless steel, bamboo, or silicone straw for sipping your iced coffee or boba."))
        tasks.append(Task(title: "Reuse Utensils", pointValue: 5, description: "Problem: \n6 million tons of plastic forks, spoons, and cutlery are tossed every year.\n\nSolution: \nBring your own reusable utensils whenever you eat out. A fork, spoon, and knife wrapped in a reusable napkin can be transported easily."))
        tasks.append(Task(title: "Paperless Receipts", pointValue: 5, description: "Problem: \nReceipts are a waste of ink and paper.\n\nSolution: \nIf it’s an option, always opt for an email or text receipt. You can even make a special email address for shopping only. That way all of your receipts are in one place and you avoid getting spammed with emails in your normal inbox."))

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTasksTableViewCell", for: indexPath) as! ListTasksTableViewCell
        let task = tasks[indexPath.row]

        cell.taskTitleLabel.text = task.title
        cell.taskPointValuelabel.text = "+" + String(task.pointValue)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
            
        default:
            print("Displaying Task/Unexpected segue identifier")
            print(totalPoints)
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let task = tasks[indexPath.row]
            let destination = segue.destination as! DisplayTaskViewController
            destination.task = task
            destination.totalPoints = totalPoints

        }
    }

}

