//
//  ProfileViewController.swift
//  InClass03
//
//  Created by Kranthi Chinnakotla on 7/12/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit



class ProfileViewController: UIViewController,DataDelegate {
    
    var user:User!
    var chars = [Character]()
    
    var delegate: DataDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
     
        
        profileName.text = user?.user_Name
        profileEmail.text = user?.user_Email
        let cnt = user?.user_Password.characters.count
        
        if(cnt != nil && cnt != 0){
        for i in 0...cnt!-1 {
            chars.append("*")
            }
        }
        
        
        
     
        profilePassword.text = String(chars)
        
       // profilePassword.text = user?.user_Password
        profileDepartment.text = user?.user_Department
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    @IBOutlet weak var profileName: UILabel!

    @IBOutlet weak var profileEmail: UILabel!
    
    
    @IBOutlet weak var profilePassword: UILabel!
    
    @IBOutlet weak var profileDepartment: UILabel!
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier! {
        case "EDITNAME":
            let nameVC = segue.destinationViewController as! nameViewController
            nameVC.delegat = self
            nameVC.name = profileName.text!
        case "EDITEMAIL":
            let emailVC = segue.destinationViewController as! EmailViewController
            emailVC.delegat = self
            emailVC.email = profileEmail.text!
        case "EDITPASSWORD":
            let passwordVC = segue.destinationViewController as! PasswordViewController
            passwordVC.delegat = self
            passwordVC.password = profilePassword.text!
        case "EDITDEPARTMENT":
            let departVC = segue.destinationViewController as! DepartmentViewController
            departVC.delegat = self
            departVC.department = profileDepartment.text!
            
        default:
            break
        }
    }
    
    
    @IBAction func showPassword(sender: UIButton) {
        
        
        if(sender.currentTitle == "Show"){
            profilePassword.text = user?.user_Password
            sender.setTitle("Hide", forState: UIControlState.Normal)}
        else if(sender.currentTitle == "Hide"){
            profilePassword.text = String(chars)
            sender.setTitle("Show", forState: UIControlState.Normal)
        }
    }
    
    /*@IBAction func udpate_profile(segue: UIStoryboardSegue){
        
        if let sourceVC = segue.sourceViewController as? nameViewController{
            
            profileName.text = sourceVC.updateName.text
        }
        if let sourceVC = segue.sourceViewController as? EmailViewController{
            
            profileEmail.text = sourceVC.update_email_text.text
        }
        if let sourceVC = segue.sourceViewController as? PasswordViewController{
            
            profilePassword.text = sourceVC.passwordText.text
        }
        if let sourceVC = segue.sourceViewController as? DepartmentViewController{
            
            profileDepartment.text = sourceVC.update_department_text.text
        }
        
    }*/
    
    func setName(name: String) {
        profileName.text! = name
        
    }
    func setEmail(email: String) {
        profileEmail.text! = email
    }
    
    func setPassword(password: String) {

        profilePassword.text! = password
    }
    
    func setDepartment(department: String) {
        profileDepartment.text! = department
    }
    
    

}
