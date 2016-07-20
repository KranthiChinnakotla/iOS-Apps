//
//  nameViewController.swift
//  InClass03
//
//  Created by Kranthi Chinnakotla on 7/12/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
protocol DataDelegate {
    func setName(name: String)
    func setEmail(email: String)
    func setPassword (password: String)
    func setDepartment (department: String)
    
}


class nameViewController: UIViewController {

    var name = ""
    var delegat: DataDelegate! = nil
    
    
    @IBOutlet weak var updateName: UITextField!
    
    @IBOutlet weak var updateButton: UIButton!
    
    @IBAction func nameupdate(sender: UIButton) {
        if let nme = updateName.text{
            delegat.setName(nme)
            self.dismissViewControllerAnimated(false, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateName.text = name

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
