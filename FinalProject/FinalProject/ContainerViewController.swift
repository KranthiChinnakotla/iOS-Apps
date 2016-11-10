//
//  ContainerViewController.swift
//  FinalProject
//
//  Created by Kranthi Chinnakotla on 11/8/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import Alamofire

class ContainerViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
   
    
    @IBOutlet weak var signOut: UIButton!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var userNameText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBOutlet weak var signIn: UIButton!
    
    var token: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signOut.isHidden = true

        // Do any additional setup after loading the view.
        
        menuButton.target = self.revealViewController()
        menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signInAction(_ sender: UIButton) {
        
        if let userName = userNameText.text , let pass = passwordText.text{
            
            
            
            Alamofire.request("http://54.197.12.149/login?username=\(userName)&password=\(pass)").responseJSON(completionHandler: { (response) in
                
                if let userAuthentication = response.result.value as? Dictionary<String,AnyObject>{
                    
                    if(userAuthentication["message"] as? String == " login Successful " ){
                        self.token = userAuthentication["token"] as? String
                        DispatchQueue.main.async {
                            self.signOut.isHidden = false
                            self.signIn.isHidden = true
                            self.passwordLabel.isHidden = true
                            self.userNameLabel.isHidden = true
                            self.userNameText.isHidden = true
                            self.passwordText.isHidden = true
                            
                        }
                    }
                    
                }
                
                
            })
                
            }
            
            
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


