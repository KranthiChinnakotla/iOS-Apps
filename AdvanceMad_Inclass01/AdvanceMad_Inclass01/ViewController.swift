//
//  ViewController.swift
//  AdvanceMad_Inclass01
//
//  Created by Kranthi Chinnakotla on 8/26/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameText: UITextField!
    
    
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBAction func signUp(sender: UIButton) {
        
        guard let name = nameText.text where nameText.text! != "" else {
            return
        }
        guard let email = emailText.text where emailText.text! != "" else{
            return
        }
        guard let password = passwordText.text where passwordText.text! != "" else{
            return
        }
        
        let urlString =  "http://www.advance_mad.comxa.com/signup.php?signup=signup&email=\(email)&password=\(password)&name=\(name)"
        
        let url = NSURL(string: urlString)
        
    if let data = try? NSData(contentsOfURL: url!, options: []){
            let json = JSON(data:data)
            if(json["id"].intValue == 0){
                let alertController = UIAlertController(title:
                    "Error", message:"User Exists" , preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }else if(json["id"].intValue == 1){
                let alertController = UIAlertController(title:
                    "Success", message:"Successfully User created" , preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (UIAlertAction) in
                    self.performSegueWithIdentifier("login", sender: self)

                }))
                self.presentViewController(alertController, animated: true, completion: nil)
                
                
            }

        }
        
        
        
        
        
    }
    
    
    @IBAction func login(sender: UIButton) {
        
        
        self.performSegueWithIdentifier("login", sender: self)
    }
    
    @IBAction func cancelUnwind(segue: UIStoryboardSegue){
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "login"){
            if let vc = segue.destinationViewController as? LoginViewController{
                vc.email = emailText.text!
                vc.password = passwordText.text!
            }
        }
    }
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*let url = "http://www.advance_mad.comxa.com/signup.html"
         let weburl = NSURL(string: url)
         let urlRequest = NSURLRequest(URL: weburl!)
         webView.scalesPageToFit = true
         webView.loadRequest(urlRequest)*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

