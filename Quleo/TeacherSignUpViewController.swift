//
//  TeacherSignUpViewController.swift
//  Quleo
//
//  Created by Fiona Rae (student LM) on 2/21/20.
//  Copyright © 2020 Jake Ridgway (student LM). All rights reserved.
//

import UIKit
import FirebaseAuth

class TeacherSignUpViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func signUpButton(_ sender: UIButton) {
    guard let email = usernameTextField.text else {return}
    guard let password = passwordTextField.text else {return}
    
    Auth.auth().createUser(withEmail: email, password: password){user, error in
        if let _ = user {
            print("User Created")
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.commitChanges(completion: { (error) in
                print("Couldn't Change Name")
            })
            self.dismiss(animated: true, completion: nil)
        }
        else{
            print(error.debugDescription)
        }
    }
    }
    
}
