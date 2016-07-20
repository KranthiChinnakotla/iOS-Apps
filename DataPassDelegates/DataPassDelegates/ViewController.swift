//
//  ViewController.swift
//  DataPassDelegates
//
//  Created by Kranthi Chinnakotla on 7/11/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataDelegate {

    @IBOutlet weak var colorView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "segueData"){
            
            let destination = segue.destinationViewController as! firstViewController
            destination.delegate = self
            if (colorView.backgroundColor!.isEqual(UIColor.redColor())){
                destination.colorText = " Was Red"}
            
            else if (colorView.backgroundColor!.isEqual(UIColor.blueColor())) {
                    destination.colorText = "Was Blue"
                }
            else if(colorView.backgroundColor!.isEqual(UIColor.yellowColor())){
                destination.colorText = "Was yellow"
            }
           else if(colorView.backgroundColor!.isEqual(UIColor.magentaColor())){
                destination.colorText = "Was Magenta"
            }
            else {
                destination.colorText = "Unselected"
            }
        }
        else
        {
            print("Unknown segue")
        }
        
    }
    
    func setColor(colorName: String) {
        if (colorName == "Red") {
            colorView.backgroundColor = UIColor.redColor()
        } else if (colorName == "Green") {
            colorView.backgroundColor = UIColor.greenColor()
        } else if (colorName == "Blue") {
            colorView.backgroundColor = UIColor.blueColor()
        }else if(colorName == "Magenta"){
            colorView.backgroundColor = UIColor.magentaColor()
        }else if(colorName == "Yellow"){
            colorView.backgroundColor = UIColor.yellowColor()
        }
    }

    
    


}

