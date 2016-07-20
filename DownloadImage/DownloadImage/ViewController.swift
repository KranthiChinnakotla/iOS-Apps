//
//  ViewController.swift
//  DownloadImage
//
//  Created by Kranthi Chinnakotla on 7/14/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0,width: 300,height: 300))
        imageView.backgroundColor = UIColor.brownColor()
        view.addSubview(imageView)
        let s = "http://dev.theappsdr.com/lectures/inclass_http/index.php?pid=0"
        let url = NSURL(string: s)
        let session = NSURLSession.sharedSession()
        let task = session.downloadTaskWithURL(url!){ (url: NSURL?, response: NSURLResponse?, e: NSError?) in
            
            let data = NSData(contentsOfURL: url!)
            let image = UIImage(data: data!)
            
            dispatch_async(dispatch_get_main_queue()) {
                
                imageView.image = image
                
                }
            }
        task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

