//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by Ayush Raniwala on 27/08/20.
//  Copyright © 2020 Ayush Raniwala. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type:GoalType){
        
        self.goalDescription = description
        self.goalType = type
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTextField.delegate = self
    }
    
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        if pointsTextField.text != ""{
            print ("Done")
        self.save{ (complete) in
            if complete{
                dismiss(animated: true, completion: nil)
            }
        }
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool) -> ()){
        guard let mangedContext = appDelegate?.persistentContainer.viewContext else{return}
        let goal = Goal(context: mangedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletitionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try mangedContext.save()
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription) ")
            completion(false)
        }
    }
}
