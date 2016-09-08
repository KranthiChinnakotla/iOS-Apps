//
//  AuthenticateViewController.swift
//  AdvanceMad_Inclass01
//
//  Created by Kranthi Chinnakotla on 8/31/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import SwiftyJSON

class AuthenticateViewController: UIViewController {

    var dataString: NSString?
    var usr: String?
    var pass: String?
    
    @IBOutlet weak var authUser: UITextField!
    
    @IBOutlet weak var authPassword: UITextField!
    
    
    @IBAction func authenticate(sender: UIButton) {
        
        if let userAuth = authUser.text where authUser.text! != ""{
            usr = userAuth
        }else{
            let alertController = UIAlertController(title:"Error", message: "Enter User details", preferredStyle: .Alert)
            UIAlertAction(title: "Exit", style: .Default, handler: nil)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        if let passAuth = authPassword.text where authPassword.text! != ""{
            pass = passAuth
        }else{
            let alertController = UIAlertController(title:"Error", message: "Enter password ", preferredStyle: .Alert)
            UIAlertAction(title: "Exit", style: .Default, handler: nil)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        let urlString = "http://echo.getpostman.com/basic-auth"
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let userPasswordString = "\(usr!):\(pass!)"
        let userPasswordData = userPasswordString.dataUsingEncoding(NSUTF8StringEncoding)
        let base64EncodedCredential = userPasswordData!.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
        let authString = "Basic \(base64EncodedCredential)"
        config.HTTPAdditionalHeaders = ["Authorization" : authString]
        let session = NSURLSession(configuration: config)
        let url = NSURL(string: urlString)
        var running = false
        
        let task = session.dataTaskWithURL(url!) { (data, response, error) in
            
            if let httpResponse = response as? NSHTTPURLResponse {
                 self.dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                let json = JSON(data:data!)
                running = json["authenticated"].boolValue
               
            }
            //running = false
            NSOperationQueue.mainQueue().addOperationWithBlock({
                if(running){
                     let alertController = UIAlertController(title:"Success", message: "Authentication", preferredStyle: .Alert)
                    alertController.addAction(
                    UIAlertAction(title:
                        "OK", style: .Default, handler: { (UIAlertAction) in
                            self.performSegueWithIdentifier("finally", sender: self)
                    }))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }else{
                    let alertController = UIAlertController(title:"Error", message: "Authentication", preferredStyle: .Alert)
                   alertController.addAction(UIAlertAction(title: "Exit", style: .Default, handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)

                }
               
            })
        }
       // running = true
        task.resume()
      /*  while running {
            sleep(1)
        }*/
    }
    
    
    var email: String?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "finally"){
            if let vc = segue.destinationViewController as? FinalViewController{
                vc.email = email
                vc.name = name
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
