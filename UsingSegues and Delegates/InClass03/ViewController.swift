//
//  ViewController.swift
//  InClass03
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
    
    
    
    @IBOutlet weak var homeName: UILabel!
    
    @IBOutlet weak var textFieldHomeName: UITextField!
    
    @IBOutlet weak var homeEmail: UILabel!
    
    @IBOutlet weak var textFieldHomeEmail: UITextField!
    
    @IBOutlet weak var homePassword: UILabel!
    
    @IBOutlet weak var textFieldHomePassword: UITextField!
    
    @IBOutlet weak var homeDepartment: UILabel!
    
    @IBOutlet weak var homeSegmentControl: UISegmentedControl!
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationVC = segue.destinationViewController
        if let navCon = destinationVC as? UINavigationController{
            destinationVC = navCon.visibleViewController ?? destinationVC
        }
        
        if textFieldHomeName.text != "" {
            
            if textFieldHomeEmail.text != ""{
                if textFieldHomePassword.text != ""{

            
            if let profileVC = destinationVC as? ProfileViewController{
                if(segue.identifier == "PROFILE"){
                    if let student_name = textFieldHomeName.text {
                        if let student_email = textFieldHomeEmail.text{
                            if let student_password = textFieldHomePassword.text{
                                profileVC.user = User()
                                switch homeSegmentControl.selectedSegmentIndex {
                                case 0:
                                    
                                    profileVC.user.user_Department = "Computer Science"
                                    profileVC.user.user_Name = student_name
                                    profileVC.user.user_Email = student_email
                                    profileVC.user.user_Password = student_password
                                    
                                case 1:
                                    profileVC.user.user_Department = "Software & Information Systems"
                                    profileVC.user.user_Name = student_name
                                    profileVC.user.user_Email = student_email
                                    profileVC.user.user_Password = student_password
                                    
                                    
                                case 2:
                                    profileVC.user.user_Department = "Bio_Informatics"
                                    profileVC.user.user_Name = student_name
                                    profileVC.user.user_Email = student_email
                                    profileVC.user.user_Password = student_password
                                    
                                default:
                                    break
                                }
                                
                                
                                
                                
                            }
                        }
                        
                        
                    }
                    
                }
        }
            }
        }
    }

    
        
        
        
        
        else {
            let alert = UIAlertController(title: "Alert", message: "Enter all the values", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
            }
    
    
    
}

