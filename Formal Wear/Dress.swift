//
//  Dress.swift
//  Formal Wear
//
//  Created by John Bergeson on 5/25/15.
//  Copyright (c) 2015 John Bergeson. All rights reserved.
//

import Foundation
import UIKit
import Parse
class Dress {
    
    
    var name : String
    var price : Double
    var store : String
    var imageData : NSData
   
    
    
    
    init(name : String, price : Double, store : String, imageData: NSData)
    {
        self.name = name;
        self.price = price;
        self.store = store;
        self.imageData = imageData;
    } 
    


func saveToServer (){
    var dress = PFObject(className:"Dress")
    dress ["store"] = store
    dress["name"] = name
    dress["price"] = price
    dress ["Image"] = PFFile(data: imageData)
dress.saveInBackgroundWithBlock {
    (success: Bool, error: NSError?) -> Void in
    if (success) {
        // The object has been saved.
    } else {
        // There was a problem, check error.description
    }
}

}
//var query = PFQuery(className:"store")
//query.getObjectInBackgroundWithId("TYycZB1CLQ") {
//    (store: PFObject?, error: NSError?) -> Void in
//    if error == nil && store != nil {
//        println(store)
//    } else {
//        println(error)
//    }
//}
}