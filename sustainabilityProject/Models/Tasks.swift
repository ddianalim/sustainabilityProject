//
//  Tasks.swift
//  sustainabilityProject
//
//  Created by Diana Lim on 10/13/18.
//  Copyright © 2018 Diana Lim. All rights reserved.
//

import Foundation

class Task {
    var title: String
    var pointValue: Int
    var description: String
    
    init(title: String, pointValue: Int, description: String) {
        self.title = title
        self.pointValue = pointValue
        self.description = description
    }
}

