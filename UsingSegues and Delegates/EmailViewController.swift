//
//  EmailViewController.swift
//  InClass03
//
//  Created by Kranthi Chinnakotla on 7/12/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit




class EmailViewController: UIViewController {

    @IBOutlet weak var update_email_text: UITextField!
    
    @IBOutlet weak var update_button: UIButton!
    
    var email = ""
    var delegat: DataDelegate! = nil
    
    @IBAction func emailUpdate(sender: UIButton) {
        if let eml = update_email_text.text{
            delegat.setEmail(eml)
            self.dismissViewControllerAnimated(false, completion: nil)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        update_email_text.text = email

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
