//
//  GoalCell.swift
//  goalpost-app
//
//  Created by Ayush Raniwala on 27/08/20.
//  Copyright © 2020 Ayush Raniwala. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    @IBOutlet weak var goalDecriptionLbl : UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    func configure (goal: Goal){
        
        self.goalDecriptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletitionValue{
            self.completionView.isHidden = false
        }
        else{
            self.completionView.isHidden = true
        }
    }


}
