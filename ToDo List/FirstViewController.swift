//
//  FirstViewController.swift
//  ToDo List
//
//  Created by Ryan Bilak on 4/8/16.
//  Copyright © 2016 inturn. All rights reserved.
//

import UIKit

//delcare global variable

var toDoList = [String]()

//add table view deleagate to control table

class FirstViewController: UIViewController, UITableViewDelegate {

    

    @IBOutlet var toDoListTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //determines if a user has saved any todo items yet, if it is not equal to nil it will restore the data in NSUSerDefaults
        
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
       
        toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
    }
    

    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }
    
    //swipe to delete functions in To Do List
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoList.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            
            toDoListTable.reloadData()
        }
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        toDoListTable.reloadData()
    }


}

