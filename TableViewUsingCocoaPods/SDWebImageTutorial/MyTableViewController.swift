//
//  MyTableViewController.swift
//  SDWebImageTutorial
//
//  Created by Kranthi Chinnakotla on 7/19/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    
    
    var allkeys: [String] =  Array(AppsData.data.keys)
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return AppsData.data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let userCell = self.tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath)
        
        
        (userCell.viewWithTag(100) as! UILabel).text = allkeys[indexPath.row]
        
        return userCell

    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "detailSegue") {
            // pass data to next view
            if let viewController = segue.destinationViewController as? SecondTableViewController {
                
                viewController.text = allkeys[(tableView.indexPathForSelectedRow?.row)!]
                
                
            }
            
            
        }
        

    }
    
    

}
