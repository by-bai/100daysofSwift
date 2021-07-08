//
//  Person.swift
//  Project10
//
//  Created by Bai on 8/7/21.
//

import UIKit

class Person: NSObject {
    //all uikit classes come from NSObject
    
    var name: String
    var image: String
    
    //objects of type String can't be empty
    //String! and String? can both be nil, but String can't, it must have a value
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }

}
