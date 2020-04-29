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

class StudentCodeViewController: UIViewController {
    
    @IBOutlet weak var studySetID: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let stringID = studySetID.text{
//            if let tempStudyID = FirebaseStorage.StorageReference.value(forKey: stringID){
//                GameStudySet.set(tempStudyID)
//                self.performSegue(withIdentifier: "toStudentMainScreen", sender: self)
//            }
        }
        
    }
    
    
    
}
