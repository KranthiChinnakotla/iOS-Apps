//
//  XmlTableViewController.swift
//  SimpleXMLParsing
//
//  Created by Kranthi Chinnakotla on 7/26/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import SWXMLHash

class XmlTableViewController: UITableViewController,NSXMLParserDelegate {

    var bookTitle = String()
    var bookAuthor = String()
    var eName = String()
    var bookss: [Books] = []
    var parseError: NSError?
    var lineNumber: Int?
    var columnNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if let path = NSBundle.mainBundle().URLForResource("Books", withExtension: "xml"){
            if let parser = NSXMLParser(contentsOfURL: path){
                parser.delegate = self
                
                let data = NSData(contentsOfURL: path)
                let xml = SWXMLHash.parse(data!)
                let books = xml["catalog"].children
                for i in 0...books.count-1{
                    let booki = Books()
                    booki.book_Title = (xml["catalog"]["book"][i]["title"].element?.text)!
                    booki.book_Author = (xml["catalog"]["book"][i]["author"].element?.text)!
                    bookss.append(booki)
                }
                
                /*if(!parser.parse()){
                    let error = parser.parserError
                    let line = parser.lineNumber
                    let column = parser.columnNumber
                    print("\(line), \(column), \(error?.localizedDescription)")
                }*/
            }
        }
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
    }
    
    
    
   /* func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        eName = elementName
        
        if (elementName == "book"){
            bookTitle = String()
            bookAuthor = String()
        }
        
        
    }
    
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if(elementName == "book"){
            let book = Books()
            book.book_Title = bookTitle
            book.book_Author = bookAuthor
            
            books.append(book)
        }
        
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        
        let data = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        if (!data.isEmpty){
            if(eName == "title"){
                bookTitle += data
            }else if(eName == "author"){
                bookAuthor += data
            }
        }
        
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookss.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("bookscell", forIndexPath: indexPath)

        // Configure the cell...
        (cell.viewWithTag(1) as? UILabel)?.text = bookss[indexPath.row].book_Title
        (cell.viewWithTag(2) as? UILabel)?.text = bookss[indexPath.row].book_Author

        return cell
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
