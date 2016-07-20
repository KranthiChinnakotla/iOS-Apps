//
//  firstViewController.swift
//  DataPassDelegates
//
//  Created by Kranthi Chinnakotla on 7/11/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

protocol DataDelegate {
    func setColor(colorName: String)
}

class firstViewController: UIViewController {

    @IBOutlet weak var colorLabel: UILabel!
    
    var delegate: DataDelegate! = nil
    var colorText: String! = nil
    
    
    
    @IBAction func pickColor(sender: UIButton) {
        if let title = sender.currentTitle {
            delegate.setColor(title)
          
        }
        
        else{
            print ("Title was not set")
        }
        
        
    }
    
    
    override func viewDidLoad() {
        
        colorLabel.text = colorText
    }
    
}
