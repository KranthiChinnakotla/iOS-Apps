//
//  PasswordViewController.swift
//  InClass03
//
//  Created by Kranthi Chinnakotla on 7/12/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    var password = ""
    var delegat: DataDelegate! = nil
    
    @IBAction func update_password(sender: UIButton) {
        if let pwd = passwordText.text{
            delegat.setPassword(pwd)
            self.dismissViewControllerAnimated(false, completion: nil)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordText.text = password

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
