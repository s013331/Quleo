//
//  Leaderboard.swift
//  Prototype Leaderboard
//
//  Created by Jake Ridgway (student LM) on 2/21/20.
//  Copyright © 2020 Jake Ridgway (student LM). All rights reserved.
//

import Foundation
import UIKit

class Leaderboard: NSObject, UITableViewDataSource{

    var leaderboardList: [(name: String, score: Int)]
    
    override init(){
        leaderboardList=[(String, Int)]()
        super.init()
    }
    
    func addEntry(_ entry: (String, Int)){
        
        leaderboardList.append(entry)
        tupleSort()
        
    }
    
    func tupleSort(){
        
        var scores=[Int]()
        var highIndex: Int
        
        for (_, score) in leaderboardList{
            scores.append(score)
        }
        
        for i in 0..<scores.count{
            
            highIndex=i
            
            for j in i..<scores.count{
                
                if scores[j]>scores[highIndex]{
                    
                    highIndex=j
                }
            }
            
            scores.swapAt(i, highIndex)
            leaderboardList.swapAt(i, highIndex)
        }
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderboardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell")!
        
        guard let cellLabel=cell.textLabel else {return cell}
        
        let entry=leaderboardList[indexPath.row]
        cellLabel.text=("\(entry.name): \(entry.score)")
        
        return cell
        
    }
    
    
}
