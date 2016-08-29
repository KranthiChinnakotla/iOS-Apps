//
//  DemoURL.swift
//  Casini
//
//  Created by Kranthi Chinnakotla on 7/13/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import Foundation

struct DemoURL {
    
    static let UNCC = "http://hi.uncc.edu/sites/hi.uncc.edu/files/media/2012_ifest_quad.jpg"
    
    static let NASA = [
    
    "Casini": "http://dev.theappsdr.com/lectures/inclass_http/index.php?pid=0",
    "Earth": "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
    "Saturn":"http://www.nasa.gov/sites/default/files/saturn_collage.jpg"]
    
    static func imageName(image: String? ) -> NSURL?{
        
        if let urlString = NASA[image ?? ""]{
            return NSURL(string: urlString)
            
        }else{
            return nil
        }
        
    }
}
