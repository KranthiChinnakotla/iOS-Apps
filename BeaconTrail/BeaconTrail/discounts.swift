//
//  discounts.swift
//  BeaconTrail
//
//  Created by Kranthi Chinnakotla on 9/8/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import Foundation

class discounts{
    var name:String = ""
    var photo:String = ""
    var price:String = ""
    var discount:String = ""
    var region:String = ""
    
    init(name:String,photo:String,price:String,discount:String,region:String) {
        self.discount = discount
        self.name = name
        self.photo = photo
        self.price = price
        self.region = region
    }
     init() {
        
    }
}
