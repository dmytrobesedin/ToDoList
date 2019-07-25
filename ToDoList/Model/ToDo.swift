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
 //   var uid: String?
    var name: String?
    var description: String?
    var dateOfComplit: Double?
    var isComplit: Bool?
    var link:DatabaseReference?
    
    
    
    init(dataSnapshot:DataSnapshot) {
      //  self.uid = dataSnapshot.value(forKey: "uid") as? String
        self.name = dataSnapshot.value(forKey: "name") as? String 
        self.description = dataSnapshot.value(forKey: "description") as? String
        self.dateOfComplit  = dataSnapshot.value(forKey: "dateOfComplit") as? Double
        self.isComplit = dataSnapshot.value(forKey: "isComplit") as? Bool
        self.link = dataSnapshot.ref
        
    }
}
