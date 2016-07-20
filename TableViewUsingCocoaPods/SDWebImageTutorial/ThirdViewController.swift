//
//  ThirdViewController.swift
//  SDWebImageTutorial
//
//  Created by Kranthi Chinnakotla on 7/19/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import SDWebImage

class ThirdViewController: UIViewController {

    var text: String? = nil
    var developer: String? = nil
    var releaseDate: String? = nil
    var price: String? = nil
    
    
    @IBOutlet weak var imageV: UIImageView!
    
    
    @IBOutlet weak var developerN: UILabel!
    
    @IBOutlet weak var releaseD: UILabel!
    
    @IBOutlet weak var priceN: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: text!)
        imageV.sd_setImageWithURL(url)
        developerN.text = developer
        releaseD.text = releaseDate
        priceN.text = price
        
    }
    
}
