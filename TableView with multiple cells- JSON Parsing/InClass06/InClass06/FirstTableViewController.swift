//
//  FirstTableViewController.swift
//  InClass06
//
//  Created by Kranthi Chinnakotla on 7/21/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import SDWebImage

class FirstTableViewController: UITableViewController {
    
    var bookApps = [Application]()
    var applicationApps = [Application]()
    var sections = Dictionary<String,[Application]>()
    
    var count = 0
    
    
    var app = [Application](){
        didSet{
            
            for aplic in app {
                if (aplic.categories == "Applications"){
                    applicationApps.append(aplic)
                    
                }else if(aplic.categories == "Books"){
                    bookApps.append(aplic)
                }
            }
            
           sections["Apps"] = applicationApps
            sections["Books"] = bookApps
        
            
            
            self.tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://dev.theappsdr.com/apis/summer_2016_ios/data.json"
        let jsonApp = ApplicationJson()
        jsonApp.parseJson(url){(app)-> Void in
            
            self.app = app


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
     }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            
            return "Apps"
        }else{
            
            return "Books"
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if(section == 0){
            
            return applicationApps.count
        }else{
            
            return bookApps.count
        }
    }

   
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell : UITableViewCell?
        if(app[indexPath.row].largeImage == nil && app[indexPath.row].summary == nil){
          
              cell = tableView.dequeueReusableCellWithIdentifier("normalcell", forIndexPath: indexPath)
            
            // Configure the cell...
            
            if(indexPath.section == 0){
                (cell!.viewWithTag(1) as? UILabel)?.text = applicationApps[indexPath.row].title
                (cell!.viewWithTag(3) as? UILabel)?.text = applicationApps[indexPath.row].artist
                (cell!.viewWithTag(4) as? UILabel)?.text = applicationApps[indexPath.row].releaseDate
                (cell!.viewWithTag(5) as? UILabel)?.text = String((applicationApps[indexPath.row].price))
                let url = NSURL(string: applicationApps[indexPath.row].smallImage)
                (cell!.viewWithTag(2) as? UIImageView)?.sd_setImageWithURL(url)
            }
            else if (indexPath.section == 1){
                (cell!.viewWithTag(1) as? UILabel)?.text = bookApps[indexPath.row].title
                (cell!.viewWithTag(3) as? UILabel)?.text = bookApps[indexPath.row].artist
                (cell!.viewWithTag(4) as? UILabel)?.text = bookApps[indexPath.row].releaseDate
                (cell!.viewWithTag(5) as? UILabel)?.text = String((bookApps[indexPath.row].price))
                
                let url = NSURL(string: bookApps[indexPath.row].smallImage)
                (cell!.viewWithTag(2) as? UIImageView)?.sd_setImageWithURL(url)
            }
            
        }

        
       
        
        
        if(app[indexPath.row].largeImage != nil && app[indexPath.row].summary == nil){
            
            
              cell = tableView.dequeueReusableCellWithIdentifier("largeImagecell", forIndexPath: indexPath)
            
            // Configure the cell...
            
            if(indexPath.section == 0){
                (cell!.viewWithTag(1) as? UILabel)?.text = applicationApps[indexPath.row].title
                (cell!.viewWithTag(3) as? UILabel)?.text = applicationApps[indexPath.row].artist
                (cell!.viewWithTag(4) as? UILabel)?.text = applicationApps[indexPath.row].releaseDate
                (cell!.viewWithTag(5) as? UILabel)?.text = String((applicationApps[indexPath.row].price))
                let url = NSURL(string: applicationApps[indexPath.row].smallImage)
                (cell!.viewWithTag(2) as? UIImageView)?.sd_setImageWithURL(url)
                if let img = applicationApps[indexPath.row].largeImage{
                    let largeUrl = NSURL(string: img)
                    (cell!.viewWithTag(6) as? UIImageView)?.sd_setImageWithURL(largeUrl)
                }
                
            }
            else if (indexPath.section == 1){
                (cell!.viewWithTag(1) as? UILabel)?.text = bookApps[indexPath.row].title
                (cell!.viewWithTag(3) as? UILabel)?.text = bookApps[indexPath.row].artist
                (cell!.viewWithTag(4) as? UILabel)?.text = bookApps[indexPath.row].releaseDate
                (cell!.viewWithTag(5) as? UILabel)?.text = String((bookApps[indexPath.row].price))
                
                let url = NSURL(string: bookApps[indexPath.row].smallImage)
                (cell!.viewWithTag(2) as? UIImageView)?.sd_setImageWithURL(url)
                if let img = bookApps[indexPath.row].largeImage{
                    let largeUrl = NSURL(string: img)
                    (cell!.viewWithTag(6) as? UIImageView)?.sd_setImageWithURL(largeUrl)
                }

            }
            
            
            
        }
        if(app[indexPath.row].largeImage == nil && app[indexPath.row].summary != nil){
            
            
             cell = tableView.dequeueReusableCellWithIdentifier("summarycell", forIndexPath: indexPath)
            
            // Configure the cell...
            
            if(indexPath.section == 0){
                (cell!.viewWithTag(1) as? UILabel)?.text = applicationApps[indexPath.row].title
                (cell!.viewWithTag(3) as? UILabel)?.text = applicationApps[indexPath.row].artist
                (cell!.viewWithTag(4) as? UILabel)?.text = applicationApps[indexPath.row].releaseDate
                
                //(cell!.viewWithTag(7) as? UILabel)?.text = applicationApps[indexPath.row].summary!
                (cell!.viewWithTag(5) as? UILabel)?.text = String((applicationApps[indexPath.row].price))
                let url = NSURL(string: applicationApps[indexPath.row].smallImage)
                (cell!.viewWithTag(2) as? UIImageView)?.sd_setImageWithURL(url)}
            else if (indexPath.section == 1){
                (cell!.viewWithTag(1) as? UILabel)?.text = bookApps[indexPath.row].title
                (cell!.viewWithTag(1) as? UILabel)?.text = bookApps[indexPath.row].title
                (cell!.viewWithTag(3) as? UILabel)?.text = bookApps[indexPath.row].artist
                (cell!.viewWithTag(4) as? UILabel)?.text = bookApps[indexPath.row].releaseDate
                (cell!.viewWithTag(7) as? UILabel)?.text = bookApps[indexPath.row].summary!
                (cell!.viewWithTag(5) as? UILabel)?.text = String((bookApps[indexPath.row].price))
                
                let url = NSURL(string: bookApps[indexPath.row].smallImage)
                (cell!.viewWithTag(2) as? UIImageView)?.sd_setImageWithURL(url)
            }
            
        }

        
            return cell!
        
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
