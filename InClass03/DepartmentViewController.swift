//
//  DepartmentViewController.swift
//  InClass03
//
//  Created by Kranthi Chinnakotla on 7/12/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class DepartmentViewController: UIViewController {

    @IBOutlet weak var update_department: UIButton!
    @IBOutlet weak var update_department_text: UITextField!
    var department = ""
    var delegat: DataDelegate! = nil
    
    
    @IBAction func udpate_department(sender: UIButton) {
        
        if let dpt = update_department_text.text{
            delegat.setDepartment(dpt)
            self.dismissViewControllerAnimated(false, completion: nil)
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        update_department_text.text = department
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
