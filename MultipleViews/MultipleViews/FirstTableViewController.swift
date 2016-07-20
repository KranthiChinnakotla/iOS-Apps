//
//  FirstTableViewController.swift
//  MultipleViews
//
//  Created by Kranthi Chinnakotla on 7/11/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit




class FirstTableViewController: UITableViewController {
    
    
    
    @IBAction func act(sender: UIStoryboardSegue) {
        
        
    }

    override func viewDidLoad() {
        
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = "Hello this is cell # \(indexPath.row)"
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueData"{
            if let destination = segue.destinationViewController as? SecondViewController{
                
                let path = tableView.indexPathForSelectedRow
                let cell = tableView.cellForRowAtIndexPath(path!)
                destination.viaSegue = (cell?.textLabel?.text)!
                }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let _ = tableView.cellForRowAtIndexPath(indexPath){
            self.performSegueWithIdentifier("segueData", sender: self)
        }
    }
}
