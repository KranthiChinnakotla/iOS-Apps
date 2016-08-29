//
//  ViewController.swift
//  YouTubeTableView
//
//  Created by Kranthi Chinnakotla on 7/18/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var names = ["Mark","Tony","Shepherd","Shelley","Wallace"]
    var breeds = ["Breed1","Breed2","Breed3","Breed4","Breed5"]
    var images = [UIImage(named: "Breed1"),UIImage(named: "Breed2"),UIImage(named: "Breed3"),UIImage(named: "Breed4"),UIImage(named:"Breed5")]
    
    

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexpath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cells", forIndexPath: indexpath) as! CustomCell
        cell.imageV.image = images[indexpath.row]
        cell.breedName.text = breeds[indexpath.row]
        cell.name.text = names[indexpath.row]
        return cell
    }


}

