//
//  StudentCodeViewController.swift
//  Quleo
//
//  Created by Fiona Rae (student LM) on 3/6/20.
//  Copyright © 2020 Jake Ridgway (student LM). All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class StudentCodeViewController: UIViewController {
    
    @IBOutlet weak var studySetID: UITextField!
    @IBOutlet weak var studentName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "students code and name")!)
        StudentName = studentName.text!
        guard let uid = Auth.auth().currentUser?.uid else {return}
        var databaseRef=Database.database().reference().child("users").child(uid)
        
        if let stringID = studySetID.text{
            if let tempStudyID = databaseRef.value(forKey: stringID){
                databaseRef.child(stringID).observe(.value, with: { DataSnapshot in
                    
                   // GameStudySet = try JSONDecoder.dec
                })
                self.performSegue(withIdentifier: "toStudentMainScreen", sender: self)
            }
        }
        
    }
    
    
    
}
