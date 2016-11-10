//
//  ViewController.swift
//  FinalProject
//
//  Created by Kranthi Chinnakotla on 11/1/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import Then
import SDCAlertView
import Alamofire

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var dialyLogLabel: UILabel!
    
    
    @IBOutlet weak var profileButton: UIBarButtonItem!
    
    
    @IBAction func backHere(segue: UIStoryboardSegue){
        
        
        
    }
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var listOfQuestions = [Questions]()
    
    func loadQuestions(){
        Alamofire.request("http://localhost:6002/questions").responseJSON { (response) in
            let a = response.result.value as? Dictionary<String,AnyObject>
            let qustns = a?["data"] as? NSArray
            self.listOfQuestions.removeAll()
            for q in qustns!{
                let question = Questions()
                let adata = q as? Dictionary<String,AnyObject>
                question.step = adata?["Step"] as! Int
                question.question = adata?["Question"] as! String
                self.listOfQuestions.append(question)
                }
            
            DispatchQueue.main.async {
                print(self.listOfQuestions.count)
            }
            
        }
    }
    
    func buttonClicked(sender: UIButton){
        
        if(sender.tag == 9){
           self.performSegue(withIdentifier: "profilesegue", sender: self)
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let button: UIButton = UIButton(type: UIButtonType.custom)
        
        button.setImage(UIImage(named: "user-icon"), for: UIControlState.normal)
        //add function for button
        button.tag = 9
        button.addTarget(self, action: #selector(buttonClicked), for: UIControlEvents.touchUpInside)
        //set frame
       button.frame = CGRect(x: 0, y: 0, width: 51, height: 41)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
        
        loadQuestions()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showdialy"){
            let vc = segue.destination as? DialyViewController
            vc?.questionsList = listOfQuestions
        }
    }
}

