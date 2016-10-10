//
//  RadioButton.swift
//  Clinical_App
//
//  Created by Kranthi Chinnakotla on 10/9/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class RadioButton: UIButton {
    
    var aleternateButton: Array<RadioButton>?
    var selectedState: String? = "radio-selected.png"{
     
        didSet{
            if selectedState != nil{
                self.setImage(UIImage(named:selectedState!), for: UIControlState.selected)
                
            }
        }
    }
    
    func unselectedButtons(){
        if aleternateButton != nil{
            self.isSelected = true
            for aButton: RadioButton in aleternateButton! {
                aButton.isSelected = false
            }
        }else{
                toggleButton()
    }
}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectedButtons()
        super.touchesBegan(touches, with: event)
    }
    
    func toggleButton(){
        if self.isSelected == false{
            self.isSelected = true
        }else if self.isSelected == true{
            self.isSelected = false
        }
    }
}
