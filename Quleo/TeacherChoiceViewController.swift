//
//  TeacherChoiceViewController.swift
//  Quleo
//
//  Created by Fiona Rae (student LM) on 2/21/20.
//  Copyright © 2020 Jake Ridgway (student LM). All rights reserved.
//

import UIKit
import FirebaseAuth

class TeacherChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = Auth.auth().currentUser{
            self.performSegue(withIdentifier: "toTeacherMainScreen", sender: self)
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
