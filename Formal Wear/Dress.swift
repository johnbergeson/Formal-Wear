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
import Bolts

protocol DressDelegate {
    func updateItems(items : NSArray);
}

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
    dress["name"] =  name
    dress["price"] = price
    dress ["Image"] = PFFile(data: imageData)
dress.saveInBackgroundWithBlock {
    (success: Bool, error: NSError?) -> Void in
    if (success) {
        println("Finished saving")
        // The object has been saved.
    } else {
        // There was a problem, check error.description
    }
}

}
    
class func queryObjects()  -> NSArray {
    var delegate: DressDelegate! = nil
    var myArray : NSArray = NSArray()
    var query:PFQuery = PFQuery(className: "Dress")
    query.findObjectsInBackgroundWithBlock {
        (objects, error) -> Void in
        var array : NSArray = objects as AnyObject! as! NSArray
        myArray = array
        
        delegate.updateItems(myArray)
       
    }
     return myArray
    
    }
   
}