//
//  ViewController.swift
//  StoryBoardID
//
//  Created by Kranthi Chinnakotla on 7/12/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func clickeMe(sender: AnyObject) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        /*let vc: UINavigationController = storyboard.instantiateViewControllerWithIdentifier("newViewController") as! UINavigationController*/
        let vc: NewViewController = storyboard.instantiateViewControllerWithIdentifier("newView") as! NewViewController
        
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
}

