//
//  TeacherLogInViewController.swift
//  Quleo
//
//  Created by Fiona Rae (student LM) on 2/27/20.
//  Copyright © 2020 Jake Ridgway (student LM). All rights reserved.
//

import UIKit
import FirebaseAuth

class TeacherLogInViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "teacher login screen")!)
        
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        guard let email = usernameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if let _ = user{
                self.dismiss(animated: false, completion: nil)
            }
            else{
                print(error!.localizedDescription)
            }
        }
    }
    
}
