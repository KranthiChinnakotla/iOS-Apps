//
//  CustomCell.swift
//  YouTubeTableView
//
//  Created by Kranthi Chinnakotla on 7/18/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var imageV: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var breedName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   

    
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
