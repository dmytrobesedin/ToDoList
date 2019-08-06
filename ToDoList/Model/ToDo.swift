//
//  ToDo.swift
//  ToDoList
//
//  Created by Дмитрий Беседин on 7/4/19.
//  Copyright © 2019 DmytroBesedin. All rights reserved.
//

import Foundation
import Firebase


class ToDo {
    var uidToDo: String?
    var name: String?
    var description: String?
    var dateOfComplit: Double?
    var isComplit: Bool?
    var link:DatabaseReference?
    
    
    
    init(dataSnapshot: DataSnapshot) {
        
        let dict = dataSnapshot.value as? [String: AnyObject]
        self.uidToDo = dict?["uidToDo"]  as? String
        self.name = dict?["name"] as? String
        self.description = dict?["description"] as? String
        self.dateOfComplit  = dict?["dateOfComplit"] as? Double
        self.isComplit = dict?["isComplit"] as? Bool
        self.link = dataSnapshot.ref
        
    }
}
