//
//  SecondTableViewController.swift
//  SDWebImageTutorial
//
//  Created by Kranthi Chinnakotla on 7/19/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import SDWebImage

class SecondTableViewController: UITableViewController {
    var text: String?
    
    
    //var tupArray = [(title:String, developer:String, imgSmall:String, imgLarge:String, relDate:String,price:String)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tupArray = ()
        
        //print(AppsData.data[text!]!.count)
        // let a = AppsData.data[text!]![0].title
      // title:  imgSmall: , imgLarge:, price:, releaseDate:) 
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return AppsData.data[text!]!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let userCell = self.tableView.dequeueReusableCellWithIdentifier("customCell2", forIndexPath: indexPath)
        
        let url = NSURL(string: AppsData.data[text!]![indexPath.row].imgSmall)
        
        
       (userCell.viewWithTag(21) as! UIImageView).sd_setImageWithURL(url)
       (userCell.viewWithTag(25) as! UILabel).text = AppsData.data[text!]![indexPath.row].title
        (userCell.viewWithTag(23) as! UILabel).text = AppsData.data[text!]![indexPath.row].developer
        (userCell.viewWithTag(24) as! UILabel).text = AppsData.data[text!]![indexPath.row].releaseDate
        (userCell.viewWithTag(22) as! UILabel).text = AppsData.data[text!]![indexPath.row].price
        
        return userCell
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
                if (segue.identifier == "segueIdentifier") {
            // pass data to next view
            if let viewController = segue.destinationViewController as? ThirdViewController {
                
                viewController.text = AppsData.data[text!]![(tableView.indexPathForSelectedRow?.row)!].imgLarge
                viewController.price = AppsData.data[text!]![(tableView.indexPathForSelectedRow?.row)!].price
                viewController.releaseDate = AppsData.data[text!]![(tableView.indexPathForSelectedRow?.row)!].releaseDate
                viewController.developer = AppsData.data[text!]![(tableView.indexPathForSelectedRow?.row)!].developer
                

                
                
            }
            
            
        }
        
    }


    
    
     



}
