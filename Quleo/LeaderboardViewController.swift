//
//  LeaderboardViewController.swift
//  Quleo
//
//  Created by Fiona Rae (student LM) on 2/27/20.
//  Copyright © 2020 Jake Ridgway (student LM). All rights reserved.
//

import UIKit
import FirebaseAuth

class LeaderboardViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var leaderboard=Leaderboard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        tableView.dataSource=leaderboard

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "LeaderBoard")!)
    }
    
}
