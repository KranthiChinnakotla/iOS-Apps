//
//  LoginViewController.swift
//  Clinical_App
//
//  Created by Kranthi Chinnakotla on 10/8/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    var fullList: [Questions] = [Questions]()
    var partialList: [Questions] = [Questions]()
    var patientsList:[Patients] = [Patients]()
    
    
    @IBOutlet weak var userName: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    

    @IBAction func submitButton(_ sender: UIButton) {
        
        var flag: Bool?
        
            if let  user = userName.text{
                for pat in patientsList{
                    if (user == pat.username && passwordText.text == pat.password){
                        flag = true
                    }
                }
                
                if(flag)!{
                    let  parameters: Parameters = ["user": user]
                    print(parameters)
                    var token: String?
                    var verifiedUser: String?
                    var err: Dictionary<String,AnyObject>?
                    var error: String?
                    if parameters["user"] as? String != ""{
                        Alamofire.request("http://localhost:8081/index.html",parameters: parameters).responseJSON(completionHandler: { (response) in
                            print(response.request)  // original URL request
                            let a = (response.result.value as? Dictionary<String,String>)!// result of response serialization
                            token = a["token"]!
                            
                            DispatchQueue.main.async {
                                
                                if token != nil {
                                    let params: Parameters = ["token": token!]
                                    Alamofire.request("http://localhost:8081/verify.html",parameters: params).responseJSON(completionHandler: { (response) in
                                        let b = (response.result.value as? Dictionary<String,AnyObject>)!
                                        verifiedUser = b["user"] as? String
                                        err = b["error"] as? Dictionary<String,AnyObject>
                                        if(err != nil){
                                            error = err!["name"] as? String
                                        }
                                        
                                        DispatchQueue.main.async {
                                            
                                            if(verifiedUser != nil){
                                                if(verifiedUser == user){
                                                    print("Verified")
                                                    self.readTheQuestions()
                                                }else if(error != nil){
                                                    let alertCon = UIAlertController(title: "Authentication Error", message: error, preferredStyle: .alert)
                                                    alertCon.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                                    self.present(alertCon, animated: true, completion: nil)
                                                    
                                                }else{
                                                    let alertCon = UIAlertController(title: "Authentication Error", message: "Invalid User", preferredStyle: .alert)
                                                    alertCon.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                                    self.present(alertCon, animated: true, completion: nil)
                                                }
                                            }
                                        }
                                    })
                                }
                            }
                        })
                        
                    }else{
                        let alertController = UIAlertController(title: "Enter Credentials", message: "Invalid UserName or Password", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                        
                    }
                }else{
                    let userAlert = UIAlertController(title: "Invalid Credentials", message: "Verify username and password", preferredStyle: .alert)
                    userAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(userAlert, animated: true, completion: nil)
                }
               
                
            }
        
        

        
    }
    
        
    @IBAction func unwindHere(segue: UIStoryboardSegue){
        
    }
    
    func verifyPatients()  {
        
        
        Alamofire.request("http://ec2-54-197-12-149.compute-1.amazonaws.com/allpatients").responseJSON { (response) in
            let pArray = response.result.value as? Array<Any>
            for a in pArray!{
                let pat = Patients()
                let b = a as? Dictionary<String,AnyObject>
                pat.username = b?["username"] as? String
                pat.password = b?["passw"] as? String
                self.patientsList.append(pat)
            }
        }
        
    }
    
    func readTheQuestions(){
        
        Alamofire.request("http://localhost:8080/api").responseJSON { (response) in
            //,method:.get,parameters: nil,encoding:JSONEncoding.default).responseJSON { (response) in
            let questions = response.result.value as? Dictionary<String,AnyObject>
            let qArray = questions?["Questions"] as? Array<AnyObject>
            for q in qArray!{
                let question = Questions()
                let a = q as? Dictionary<String,String>
                question.category = a?["Category"]
                question.checkbox = a?["Checkbox"]
                question.question = a?["Question"]
                
                if(Int((a?["Options"])!) == 5){
                    question.options = ["1","2","3","4","5"]
                }else if(Int((a?["Options"])!) == 7){
                    question.options = ["0","1","2","3","4","5","6","7"]
                }else if(Int((a?["Options"])!) == 0){
                    question.options = ["0"]
                }
                
                self.fullList.append(question)
                if(a?["Category"] != "Medication Usage"){
                    self.partialList.append(question)
                }
            }
            self.performSegue(withIdentifier:
                "questionnaire", sender: self)
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verifyPatients()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "questionnaire"){
            let questionViewController = segue.destination as? ViewController
            questionViewController?.questionsFullList = fullList
            questionViewController?.quetionsPartialList = partialList
            

            
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

}
