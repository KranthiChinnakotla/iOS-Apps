//
//  ViewController.swift
//  Clinical_App
//
//  Created by Kranthi Chinnakotla on 10/6/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var selecButtonOutlet: UIButton!
    
    @IBOutlet weak var additionQuestionText: UILabel!
    @IBAction func prevButton(_ sender: UIButton) {
        
        
        
        if(count > 0 && selectedList.count != 0){
            count -= 1
            question.text = selectedList[count].question!
            sampleQuestions = (selectedList[count].options)!
            picker.reloadAllComponents()
            if(selectedList[count].checkbox != "null"){
                additionalQuestion()            }
        }
    }
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        
        count += 1
        if(count == selectedList.count){
            count -= 1
        }
        if(count < selectedList.count){
            
                question.text = selectedList[count].question!
                sampleQuestions = (selectedList[count].options)!
                picker.reloadAllComponents()
            if(selectedList[count].checkbox != "null"){
                additionalQuestion()
            }

            
        }
       
        
    }
    
    
    @IBAction func buttonSelected(_ sender: UIButton) {
        
        
    }
    
    func additionalQuestion(){
        let checkAlert = UIAlertController(title: "Additional Question", message: selectedList[count].checkbox!, preferredStyle: .alert)
        checkAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
            
        }))
        checkAlert.addAction(UIAlertAction(title: "No", style: .default, handler: { (UIAlertAction) in
            
        }))
        self.present(checkAlert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var radioButtonYes: UIButton!
    
    
    @IBOutlet weak var radioButtonNo: UIButton!
    
    @IBAction func yesButton(_ sender: UIButton) {
        radioButtonYes.isSelected = true
        radioButtonNo.isSelected = false
        toggleButton()
        
    }
    
    @IBAction func noButton(_ sender: UIButton) {
        radioButtonNo.isSelected = true
        radioButtonYes.isSelected = false
        toggleButton()
    }
    //let preferences = UserDefaults.standard
    
    var bp:Bool = false
    var questionsFullList: [Questions] = [Questions]()
    var quetionsPartialList: [Questions] = [Questions]()
    var selectedList: [Questions] = [Questions]()
    var count: Int = 0
    let key = "KEY"
    
    
    var sampleQuestions = [String]()
    var selectedQuestion = [String]()
    

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sampleQuestions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return sampleQuestions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedQuestion.append(sampleQuestions[row])
        
    }
    
    func toggleButton(){
        if(radioButtonYes.isSelected){
            radioButtonYes.setImage(UIImage(named:"radio-selected"), for: UIControlState.selected)
            radioButtonNo.setImage(UIImage(named:"radio-unselected"), for: UIControlState.normal)
        }else if(radioButtonNo.isSelected){
            radioButtonYes.setImage(UIImage(named:"radio-unselected"), for: UIControlState.normal)
            radioButtonNo.setImage(UIImage(named:"radio-selected"), for: UIControlState.selected)
        }
    }
    
    func medicationAlert(){
        
        if(bp){
            let medicationAlert = UIAlertController(title: "Input Required", message: "If yes, has your doctor prescribed medication or pills to treat your high bloodpressure? ", preferredStyle: .alert)
            medicationAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
                self.selectedList = self.quetionsPartialList
                if(self.selectedList.count>0){
                    self.question.text = self.selectedList[self.count].question!
                    self.sampleQuestions = (self.selectedList[self.count].options)!
                    self.picker.reloadAllComponents()
                }
                
            }))
            medicationAlert.addAction(UIAlertAction(title: "No", style: .default, handler: { (UIAlertAction) in
                self.selectedList = self.questionsFullList
                if(self.selectedList.count>0){
                    self.question.text = self.selectedList[self.count].question!
                    self.sampleQuestions = (self.selectedList[self.count].options)!
                    self.picker.reloadAllComponents()
                    self.additionalQuestion()
                }
            }))
            self.present(medicationAlert, animated: true, completion: nil)
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
               
        let bpAlert = UIAlertController(title: "Input Required", message: "Has your doctor told you that you have high blood pressure? ", preferredStyle: .alert)
        bpAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
            self.bp = true
            self.medicationAlert()
            
        }))
        bpAlert.addAction(UIAlertAction(title: "No", style: .default, handler: { (UIAlertAction) in
            self.selectedList = self.questionsFullList
            if(self.selectedList.count>0){
                self.question.text = self.selectedList[self.count].question!
                self.sampleQuestions = (self.selectedList[self.count].options)!
                self.picker.reloadAllComponents()
                self.additionalQuestion()
            }
        }))
        self.present(bpAlert, animated: true, completion: nil)
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selecButtonOutlet.isHidden = true
        additionQuestionText.isHidden = true
        
       
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

