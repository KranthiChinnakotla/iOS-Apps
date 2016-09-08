//
//  LoginViewController.swift
//  AdvanceMad_Inclass01
//
//  Created by Kranthi Chinnakotla on 8/31/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBOutlet weak var passWordText: UITextField!
    
    var email: String?
    var password: String?
    var emailJson: String?
    var nameJson: String?
    

    @IBAction func login(sender: UIButton) {
       let urlString = "http://www.advance_mad.comxa.com/login.php?login=login&password=\(password!)&email=\(email!)"
        let url = NSURL(string: urlString)
        if let data = try? NSData(contentsOfURL: url!, options: []){
            let json = JSON(data:data)
            emailJson = json["data"]["email"].stringValue
            nameJson = json["data"]["name"].stringValue

            if(json["status_message"].stringValue=="login sucesfull"){
                let alertController = UIAlertController(title:
                    "Success", message:"LoggedIn Succesfully" , preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (UIAlertAction) in
                    self.performSegueWithIdentifier("final", sender: self)
                    
                }))
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }else if(json["status_message"].stringValue=="invalid credentials"){
                let alertController = UIAlertController(title:
                    "Error", message:"LogIn failed, user doesn't exist" , preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if (email != nil){
            emailText.text = email
        }
        if(password != nil){
            passWordText.text = password
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "final"){
            if let vc = segue.destinationViewController as?AuthenticateViewController{
                vc.email = emailText.text
                vc.name = nameJson
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
