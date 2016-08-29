//
//  ViewController.swift
//  AdvanceMad_Inclass01
//
//  Created by Kranthi Chinnakotla on 8/26/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = "http://localhost/source/register.php"
        let weburl = NSURL(string: url)
        let urlRequest = NSURLRequest(URL: weburl!)
        webView.loadRequest(urlRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

