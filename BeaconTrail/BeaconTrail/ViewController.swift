//
//  ViewController.swift
//  BeaconTrail
//
//  Created by Kranthi Chinnakotla on 9/8/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import SDWebImage
import SwiftyJSON

class ViewController: UIViewController, ESTBeaconManagerDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var ad = discounts()
    let beaconManager = ESTBeaconManager()
    var discountsData = [discounts]()
    var discProd = [discounts]()
    var discGroc = [discounts]()
    var discLife = [discounts]()
    //var count: Int?
    var placesByBeacon: Dictionary<String,[discounts]>?
    let beaconRegion = CLBeaconRegion(
        proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!,
        identifier: "ranged region")
   

    
    
   /* let placesByBeacons = [
        "45153:9209": [
            "Heavenly Sandwiches", // read as: it's 50 meters from
            // "Heavenly Sandwiches" to the beacon with
            // major 6574 and minor 54631
            "Green & Green Salads",
            "Mini Panini"
        ],
        "48071:25324": [
            "Heavenly Sandwiches",
            "Green & Green Salads",
            "Mini Panini"
        ],
        "15212:31506": [
            "Heavenly Sandwiches",
            "Green & Green Salads",
            "Mini Panini"
        ]
    ]*/
    
  
   
    func placesNearBeacon(beacon: CLBeacon) -> [discounts]? {
        let beaconKey = "\(beacon.major):\(beacon.minor)"
        if let places = self.placesByBeacon![beaconKey] {
            //let sortedPlaces = Array(places)//.sort { $0.1 < $1.1 }.map { $0.0 }
            discountsData = places
            return discountsData
        }
        return nil
    }
    
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        if let nearestBeacon = beacons.first, places = placesNearBeacon(nearestBeacon) {
            
            self.tableView.reloadData()
           
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.discountsData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexpath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("usercell", forIndexPath: indexpath)
        (cell.viewWithTag(2) as? UILabel)?.text = discountsData[indexpath.row].name
        (cell.viewWithTag(3) as? UILabel)?.text = discountsData[indexpath.row].discount
        (cell.viewWithTag(101) as? UILabel)?.text = discountsData[indexpath.row].price
        (cell.viewWithTag(102) as? UILabel)?.text = discountsData[indexpath.row].region
        switch discountsData[indexpath.row].photo {
        case "coca-cola.png":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "coca-cola")
            break
        case "milk.jpg":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "milk")
            break
        case "watermellon.jpg":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "watermellon")
            break
        case "lettuce.png":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "lettuce")
            break
        case "dial_soap.jpg":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "dial_soap")
            break
        case "us-weekly.png":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "us-weekly")
            break
        case "scotch-brite-sponges.png":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "scotch-brite-sponges")
            break
        case "organix-conditioner.png":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "organix-conditioner")
            break
        case "jelly-beans.png":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "jelly-beans")
            break
        case "hi-c-fruit-punch.png":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "hi-c-fruit-punch")
            break
        case "cranberry-cocktail.png":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "cranberry-cocktail")
            break
        case "croissants.png":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "croissants")
            break
        case "gatorade.png":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "gatorade")
            break
        case "oranges.png":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "oranges")
            break
        case "fresh-nectarines.png":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "fresh-nectarines")
            break
        case "spinach.png":
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "spinach")
            break
        
        
        default:
            (cell.viewWithTag(1) as? UIImageView)?.image = UIImage(named: "coca-cola")
        }
        
        return cell
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()
        
        
    
        
        let urlString =  "http://ec2-52-87-240-156.compute-1.amazonaws.com/datafetch"
        
        let url = NSURL(string: urlString)
        
        if let data = try? NSData(contentsOfURL: url!, options: NSDataReadingOptions()){
            let json = JSON(data:data)
            
//           print(json["discounts"])
//
//            print(stories.count)
            for (index, object) in json {
                
                var ids:String = ""
                var smallI:String = ""
                var largeI:String = ""
                var title:String = ""
                var pubDate:String = ""
                var teaser:String = ""
                var audioFile:String = ""
                
                if let title1 = object["name"].string {
                    ids = title1
                }else {
                    print(object["name"].error)
                }
                
                if let title1 = object["photo"].string {
                    title = title1
                }else {
                    print(object["photo"].error)
                }
                
                if let pubDate1 = object["price"].string {
                    pubDate = pubDate1
                }else {
                    print(object["price"].error)
                }
                
                
                if let smallImage = object["discount"].string {
                    smallI = smallImage
                }else{
                    print(object["discount"].error)
                }
                
                if let reg = object["region"].string {
                    largeI = reg
                    if(largeI == "produce"){
                        discProd.append(discounts(name:ids,photo: title,price: pubDate,discount: smallI,region: largeI))
                    }else if(largeI == "grocery"){
                        discGroc.append(discounts(name:ids,photo: title,price: pubDate,discount: smallI,region: largeI))
                    }else if(largeI == "lifestyle"){
                        discLife.append(discounts(name:ids,photo: title,price: pubDate,discount: smallI,region: largeI))
                    }
                }else{
                    print(object["region"].error)
                }
              //  discountsData.append(discounts(name:ids,photo: title,price: pubDate,discount: smallI,region: largeI))
                
            }
            self.tableView.reloadData()

        }

        
         placesByBeacon = [
            "45153:9209":  discProd,
            "48071:25324": discLife,
            "15212:31506": discGroc
            
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        self.beaconManager.stopRangingBeaconsInRegion(self.beaconRegion)
        
    }


}

