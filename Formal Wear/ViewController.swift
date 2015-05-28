//
//  ViewController.swift
//  Formal Wear
//
//  Created by John Bergeson on 5/25/15.
//  Copyright (c) 2015 John Bergeson. All rights reserved.
//

import UIKit
import AddressBook

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var mytableView: UITableView!
    
    var items = ["One", "Two"]

    override func viewDidLoad() {
        super.viewDidLoad()
        var img = UIImage(named: "image.jpg")
        var data = UIImageJPEGRepresentation(img, 0.8)
        var myDress = Dress(name: "Jason", price: 1200, store: "Macy's", imageData: data)
        myDress.saveToServer()
        
        
        
        self.mytableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.mytableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell = UITableViewCell ()
        
        
        cell.textLabel?.text = self.items [indexPath.row]
        
        
        return cell; 
    }
    
    
}

