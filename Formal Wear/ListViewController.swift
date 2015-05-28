//
//  ListViewController.swift
//  Formal Wear
//
//  Created by John Bergeson on 5/25/15.
//  Copyright (c) 2015 John Bergeson. All rights reserved.
//

import Foundation
import UIKit

class ListViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView : UITableView = UITableView()
    
    
    override func viewDidLoad() {
        tableView.delegate = self;
        tableView.rowHeight = 100;
    }
   
    
    
    
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell()
        let imageView = UIImageView()
        imageView.frame = CGRectMake(10, 10, 80, 80)
        cell.addSubview(imageView)
        
        return cell
    }
    
    func getObjectByID(id : String) {
     
    }
    
    
    
    
}

//var query = PFQuery(className:"store")
//query.getObjectInBackgroundWithId("TYycZB1CLQ") {
//    (store: PFObject?, error: NSError?) -> Void in
//    if error == nil && gameScore != nil {
//        println(gameScore)
//    } else {
//        println(error)
//    }
//}
