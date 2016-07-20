//
//  SecondViewController.swift
//  MultipleViews
//
//  Created by Kranthi Chinnakotla on 7/11/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var segueLabel: UILabel!
    var viaSegue = ""
    
    override func viewDidLoad() {
        segueLabel.text = viaSegue
        self.performSegueWithIdentifier("unWindToMain", sender: self)
    }
    
    
        
}
