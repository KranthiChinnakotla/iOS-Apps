//
//  ViewController.swift
//  TipCalculator
//
//  Created by Kranthi Chinnakotla on 7/8/16.
//  Copyright © 2016 edu.uncc.Homework01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var currentSliderValue: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var enterBillAmount: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    
    
    
    @IBAction func customTip(sender: UISlider) {
        
        currentSliderValue.text = String(Int(sender.value)) + " %"
        
        segmentChange(segmentedControl)
        
    }
    
    
    
    @IBAction func segmentChange(sender: AnyObject) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            if let amount = Double(enterBillAmount.text!){
                totalLabel.text = String (((10 * amount)/100) + amount)
                tipLabel.text = String((10 * amount)/100)
            }
            else{
                totalLabel.text = String(0.0)
                tipLabel.text = String (0.0)
            }
        case 1:
            if let amount = Double(enterBillAmount.text!){
                totalLabel.text = String (((15 * amount)/100) + amount)
                tipLabel.text = String((15 * amount)/100)
            }
            else{
                totalLabel.text = String(0.0)
                tipLabel.text = String (0.0)
            }
            
        case 2:
            if let amount = Double(enterBillAmount.text!){
                totalLabel.text = String (((18 * amount)/100) + amount)
                tipLabel.text = String((18 * amount)/100)
            }
            else{
                totalLabel.text = String(0.0)
                tipLabel.text = String (0.0)
            }
        case 3:
            
            let sliderValue = Int(slider.value)
            
            if let amount = Double(enterBillAmount.text!){
                totalLabel.text = String (((Double(sliderValue) * amount)/100) + amount)
                tipLabel.text = String((Double(sliderValue) * amount)/100)
            }
            else{
                totalLabel.text = String(0.0)
                tipLabel.text = String (0.0)
            }
            
            
            
        default:
            break
        }
    }
    
    @IBAction func editTextChanged(sender: UITextField) {
        
        
        if let amount = Double(sender.text!){
            if amount > 0{
                totalLabel.text = String (((10 * amount)/100) + amount)
                tipLabel.text = String((10 * amount)/100)}
            else{
                let alert = UIAlertController(title: "Error", message: "Negative Values are not accepted", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Enter Again", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        else{
            totalLabel.text = String(0.0)
            tipLabel.text = String (0.0)
            
            if(sender.text != ""){
                let alert = UIAlertController(title: "Error", message: "Invalid Characters", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Enter Again", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)}
            
                    
        }
    }
    
    
    
    @IBAction func clear(sender: AnyObject) {
        
        enterBillAmount.text?.removeAll()
        totalLabel.text = String(0.00)
        tipLabel.text = String (0.00)
        slider.setValue(25, animated: true)
        currentSliderValue.text = String(Int(slider.value)) + " %"
        segmentedControl.selectedSegmentIndex = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}













