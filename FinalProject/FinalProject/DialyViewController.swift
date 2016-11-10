//
//  DialyViewController.swift
//  FinalProject
//
//  Created by Kranthi Chinnakotla on 11/2/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import SDCAlertView


class DialyViewController: UIViewController {
    
    var questionsList = [Questions]()
    
    @IBOutlet weak var goBack: UIButton!
    
    @IBAction func cameraPick(_ sender: UIButton) {
        self.pickAnImage()
    }
    
    
    var count = 0
    @IBOutlet weak var imageFromCamera: UIImageView!

    @IBOutlet weak var scrolleView: UIScrollView!
    
    @IBOutlet weak var questionText: UITextField!
    @IBOutlet weak var timeText: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var responsetext: UITextField!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var contButLabel: UIButton!
    @IBAction func continueButton(_ sender: UIButton) {
        
        if(responsetext.text != ""){
            if (count < questionsList.count - 1){
                count += 1
                showQuestion(cnt: count)
            }else{
                let alert = AlertController(title: "This is the last question", message: "click OK ", preferredStyle: .actionSheet)
                alert.add(AlertAction(title: "OK", style: .normal))
                alert.present()
            }

        }
    }
    
    
    @IBAction func previousQuestion(_ sender: UIButton) {
        
            if (count > 0){
                count -= 1
                showQuestion(cnt: count)
            
            }else{
                let alert = AlertController(title: "You are at first Question", message: "click OK ", preferredStyle: .actionSheet)
                alert.add(AlertAction(title: "OK", style: .preferred))
                alert.present()
        }

        
    }
    
    func showQuestion(cnt: Int){
        questionText.text = questionsList[cnt].question
        responsetext.text = ""
        
        
    }
    
    func hideshow(status: Bool){
        informationLabel.isHidden = status
        responsetext.isHidden = status
        contButLabel.isHidden = status
        prevButton.isHidden = status;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideshow(status: true)
        showQuestion(cnt: count)
        if (questionText.text != ""){
            hideshow(status: false)
        }
        
        let date = NSDate()
        let calendar = NSCalendar.current
        let year = calendar.component(.year, from: date as Date)
        let month = calendar.component(.month, from: date as Date)
        let day = calendar.component(.day, from: date as Date)
        let hour = calendar.component(.hour, from: date as Date)
        let minutes = calendar.component(.minute, from: date as Date)
        
        timeText.text = "Date:\(month)/\(day)/\(year) Time:\(hour):\(minutes)"
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        goBack.isHidden = true
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
