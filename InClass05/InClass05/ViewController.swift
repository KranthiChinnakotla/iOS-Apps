//
//  ViewController.swift
//  InClass05
//
//  Created by Kranthi Chinnakotla on 9/22/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var x = 0
    var user: Users?
    var users = [Users]()

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func sortFirstName(_ sender: UIButton) {
        let urlString = "http://ec2-52-87-240-156.compute-1.amazonaws.com/datafetch/first_name/"
        jsonParse(fName: urlString, button: true)

    }
    
    
    @IBAction func sortLastName(_ sender: UIButton) {
        let urlString = "http://ec2-52-87-240-156.compute-1.amazonaws.com/datafetch/last_name/"
        jsonParse(fName: urlString, button: true)

    }
    
    
    @IBAction func sortGender(_ sender: UIButton) {
        let urlString = "http://ec2-52-87-240-156.compute-1.amazonaws.com/datafetch/gender/"
        jsonParse(fName: urlString, button: true)

    }
    
    
    @IBAction func clearSort(_ sender: UIButton) {
        let urlString = "http://ec2-52-87-240-156.compute-1.amazonaws.com/datafetch/"
        jsonParse(fName: urlString,button: true)

    }
    
    func jsonParse(fName: String,button: Bool){
       
       
        let url = fName + "\(x)";
        if(!button){
            if(x<950){
                x=x+50
            }
            
        }
       
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
             self.users.removeAll()
            let a = response.result.value as! NSArray
            for e in 1...a.count-1{
                let userDict =  a[e] as! Dictionary<String,AnyObject>
                self.user = Users()
                self.user?.email = userDict["email"] as? String
                self.user?.firstName = userDict["first_name"] as? String
                self.user?.gender = userDict["gender"] as? String
                self.user?.lastName = userDict["last_name"] as? String
                self.users.append(self.user!)
                
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
         }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    let urlString = "http://ec2-52-87-240-156.compute-1.amazonaws.com/datafetch/"
       jsonParse(fName: urlString,button: false)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.users.count+1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if(indexPath.row < users.count && users.count != 0){
            cell = tableView.dequeueReusableCell(withIdentifier: "usercell", for: indexPath)
            (cell.viewWithTag(1) as? UILabel)?.text = users[indexPath.row].firstName
            (cell.viewWithTag(2) as? UILabel)?.text = users[indexPath.row].lastName
            (cell.viewWithTag(3) as? UILabel)?.text = users[indexPath.row].gender
            (cell.viewWithTag(4) as? UILabel)?.text = users[indexPath.row].email
            
        }else if(indexPath.row == users.count && users.count != 0){
            cell = tableView.dequeueReusableCell(withIdentifier: "loadcell", for: indexPath)
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == users.count){
             let urlString = "http://ec2-52-87-240-156.compute-1.amazonaws.com/datafetch/"
            jsonParse(fName: urlString,button: false)
        }
    }

}

