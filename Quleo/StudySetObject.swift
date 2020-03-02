//
//  StudySetObject.swift
//  StudySetDictionary
//
//  Created by Robert Silver (student LM) on 2/26/20.
//  Copyright © 2020 Robert Silver (student LM). All rights reserved.
//

import Foundation

class studySetObject{
    var set : [String:String]
    var name : String
    
    init(){
        set = [:]
        name = "default"
    }
    init(dic: [String:String],nam : String){
        set = dic
        name = nam
    }
    
}
