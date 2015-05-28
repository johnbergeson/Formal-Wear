//
//  ViewController.swift
//  Formal Wear
//
//  Created by John Bergeson on 5/25/15.
//  Copyright (c) 2015 John Bergeson. All rights reserved.
//

import UIKit
import AddressBook
import Parse
import Bolts


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DressDelegate
{
    var tableView = UITableView()
    
    var items = [PFObject]()

    
    
    override func viewDidLoad() {
        tableView.frame = CGRectMake(0, 20, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - 20)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 100;
        self.view.addSubview(tableView)
        var items = queryObjects()
        
    }
    
    func updateItems(items: NSArray) {
        println("Updating")
        self.items = items as! [(PFObject)]
        tableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell()
        let imageView = UIImageView()
        imageView.frame = CGRectMake(10, 20, 70, 70)
        
        let imageFile : PFFile = items[indexPath.row].objectForKey("Image") as! PFFile
        var imageData = imageFile.getData()
        let image = UIImage(data: imageData!)
        imageView.image = image
        cell.addSubview(imageView)
        
        let nameLabel = UILabel()
        nameLabel.frame = CGRectMake(100, 20, 0, 0)
        nameLabel.text = items[indexPath.row].objectForKey("name") as? String
         nameLabel.font = UIFont(name: "AvenirNext-Regular", size: 18)
        nameLabel.sizeToFit()
        var width = UIScreen.mainScreen().bounds.width
        nameLabel.frame = CGRectMake(width / 2 + nameLabel.frame.width / 2, 20, nameLabel.frame.width, nameLabel.frame.height)
        
        
        cell.addSubview(nameLabel)
   
        var lastHeight = 20 + nameLabel.frame.height
        
        let storeLabel = UILabel()
        storeLabel.frame = CGRectMake(100, lastHeight + 4, 0, 0)
        storeLabel.text = items[indexPath.row].objectForKey("store") as? String
        storeLabel.font = UIFont(name: "AvenirNext-Regular", size: 18)
        storeLabel.sizeToFit()
        storeLabel.frame = CGRectMake(width / 2 + storeLabel.frame.width / 2, lastHeight + 5, storeLabel.frame.width, storeLabel.frame.height)
        
        
        cell.addSubview(storeLabel)
        
        lastHeight += storeLabel.frame.height + 4
        let priceLabel = UILabel()
        priceLabel.frame = CGRectMake(100, lastHeight + 5, 0, 0)
        var price =  items[indexPath.row].objectForKey("price") as? Int
        
        var priceString =  "\(price!)"
        priceLabel.text = priceString
         priceLabel.font = UIFont(name: "AvenirNext-Regular", size: 18)
        priceLabel.sizeToFit()
        priceLabel.frame = CGRectMake(width / 2 + priceLabel.frame.width / 2, lastHeight + 5, priceLabel.frame.width, priceLabel.frame.height)
        
        
        cell.addSubview(priceLabel)

        
        return cell
    }
    
    func queryObjects() {
        var myArray : NSArray = NSArray()
        var query:PFQuery = PFQuery(className: "Dress")
        query.findObjectsInBackgroundWithBlock {
            (objects, error) -> Void in
            
                var array : NSArray = objects as AnyObject! as! NSArray
                print(array.count)
                self.items = array as! [(PFObject)]
                self.tableView.reloadData()
        }
        
    }
  
    

    
    
}

