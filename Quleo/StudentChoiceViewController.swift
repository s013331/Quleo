//
//  StudentChoiceViewController.swift
//  Quleo
//
//  Created by Fiona Rae (student LM) on 3/6/20.
//  Copyright © 2020 Jake Ridgway (student LM). All rights reserved.
//

import UIKit
import FirebaseAuth

class StudentChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = Auth.auth().currentUser{
            self.performSegue(withIdentifier: "toStudentMainScreen", sender: self)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
