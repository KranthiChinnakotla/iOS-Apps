//
//  ProfileViewController.swift
//  FinalProject
//
//  Created by Kranthi Chinnakotla on 11/3/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

   
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBAction func selectAnImage(_ sender: UIButton) {
        self.pickAnImage()
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.image = UIImage(named: "user-icon")

        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        profileImage = {
//            let imageView = UIImageView()
//            imageView.image = UIImage(named: "user-icon")
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            imageView.contentMode = .scaleAspectFill
//            return imageView
//            
//            
//        }()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
