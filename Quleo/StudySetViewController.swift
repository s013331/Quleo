//
//  StudySetViewController.swift
//  Quleo
//
//  Created by Robert Silver (student LM) on 2/27/20.
//  Copyright © 2020 Jake Ridgway (student LM). All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class StudySetViewController: UIViewController {
    
    
    var studySet : [String:String] = [:]
    var set = studySetObject()
    var terms : [String] = []
    var defs : [String] = []
    var numOfTerms = 0
    @IBOutlet weak var TermInput: UITextField!
    @IBOutlet weak var defInput: UITextField!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var setDisplay: UITextView!
    
    var databaseRef=Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Adding flash cards")!)
        
    }
    @IBAction func AddTerm(_ sender: UIButton) {
        if let t = TermInput.text{
            if let d = defInput.text{
                terms.append(t)
                defs.append(d)
                studySet[t] = d
            }
        }
        TermInput.text = ""
        defInput.text = ""
        numOfTerms += 1
        
        print("\(studySet)  \(numOfTerms)")
        var word : String = ""
        for i in 0...numOfTerms-1{
            word += "\(i+1). " + terms[i] + " = " + defs[i] + "\n"
        }
        setDisplay.text = word
        TermInput.resignFirstResponder()
        defInput.resignFirstResponder()
        
 
        
    }
    
    @IBAction func completeSet(_ sender: UIButton) {
        
        var setJson: Data
        
        set.set = studySet
        if let name = Name.text{
            set.name = name
        }
        do{
            setJson=try JSONEncoder().encode(set)
            guard let uid=Auth.auth().currentUser?.uid else {return}
        databaseRef.child("users").child(uid).child("Sets").child(set.name).setValue(setJson)
            
        }catch let jsonErr{
            print("\(jsonErr)")
        }
        
        
    
    }
    
}
