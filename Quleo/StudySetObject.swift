//
//  StudySetObject.swift
//  StudySetDictionary
//
//  Created by Robert Silver (student LM) on 2/26/20.
//  Copyright © 2020 Robert Silver (student LM). All rights reserved.
//

import Foundation

struct studySetObject: Codable{
    var set : [String:String]
    var competitors: [String:Int]
    var name : String
    
    init (){
        set=[String:String]()
        competitors=[String:Int]()
        name=""
    }
}
