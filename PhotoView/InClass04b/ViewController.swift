//
//  ViewController.swift
//  InClass04b
//
//  Created by Kranthi Chinnakotla on 7/14/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   // var countf = 0
    var countp = 0
    var pict: String = ""
    //var imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        imageView.backgroundColor = UIColor.orangeColor()
        
        self.view.addSubview(imageView)
        
        let s = Pictures.animals[0]!
        
        let url = NSURL(string: s)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.downloadTaskWithURL(url!){
            
            
            (url: NSURL?, res: NSURLResponse?, e: NSError?) in
            self.spinner?.startAnimating()
            let d = NSData(contentsOfURL: url!)
            let image = UIImage(data: d!)
            dispatch_async(dispatch_get_main_queue()) {
                self.imageView.image = image
                }
            self.spinner?.stopAnimating()
        }
        
        task.resume()


        
        
    }
    
    @IBAction func previous(sender: UIButton) {
        self.spinner?.startAnimating()
        if(countp == 0){
            countp = 19
            let s = Pictures.animals[countp]!
            
            let url = NSURL(string: s)
            
            let session = NSURLSession.sharedSession()
            
            let task = session.downloadTaskWithURL(url!){
                (url: NSURL?, res: NSURLResponse?, e: NSError?) in
                
                let d = NSData(contentsOfURL: url!)
                let image = UIImage(data: d!)
                dispatch_async(dispatch_get_main_queue()) {
                    self.imageView.image = image
                    self.spinner?.stopAnimating()
                }
                
            }
            
            task.resume()
        }else{
            countp = countp - 1
            let s = Pictures.animals[countp]!
            
            let url = NSURL(string: s)
            
            let session = NSURLSession.sharedSession()
            
            let task = session.downloadTaskWithURL(url!){
                (url: NSURL?, res: NSURLResponse?, e: NSError?) in
                
                let d = NSData(contentsOfURL: url!)
                let image = UIImage(data: d!)
                dispatch_async(dispatch_get_main_queue()) {
                    self.imageView.image = image
                    self.spinner?.stopAnimating()
                }
                
            }
            
            task.resume()
        }
    }
    
    @IBAction func next(sender: UIButton) {
        self.spinner?.startAnimating()
        if (countp == 19){
            countp = 0
            let s = Pictures.animals[countp]!
            
            let url = NSURL(string: s)
            
            let session = NSURLSession.sharedSession()
            
            let task = session.downloadTaskWithURL(url!){
                (url: NSURL?, res: NSURLResponse?, e: NSError?) in
                self.spinner?.startAnimating()
                let d = NSData(contentsOfURL: url!)
                let image = UIImage(data: d!)
                dispatch_async(dispatch_get_main_queue()) {
                    self.imageView.image = image
                    self.spinner?.stopAnimating()
                }
                
            }
            
            task.resume()
        }else{
            countp = countp + 1
            let s = Pictures.animals[countp]!
            
            let url = NSURL(string: s)
            
            let session = NSURLSession.sharedSession()
            
            let task = session.downloadTaskWithURL(url!){
                (url: NSURL?, res: NSURLResponse?, e: NSError?) in
                self.spinner?.startAnimating()
                let d = NSData(contentsOfURL: url!)
                let image = UIImage(data: d!)
                dispatch_async(dispatch_get_main_queue()) {
                    self.imageView.image = image
                    self.spinner?.stopAnimating()
                }
                
            }
            
            task.resume()
        }

        
        
        
        
    }
    
}





