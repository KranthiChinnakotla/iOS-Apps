//
//  ViewController.swift
//  Group3AdvMobile
//
//  Created by Kranthi Chinnakotla on 9/15/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,ESTBeaconManagerDelegate,UITableViewDelegate,UITableViewDataSource {
    
    
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
        proximityUUID: UUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!,
        identifier: "ranged region")


    
    func placesNearBeacon(_ beacon: CLBeacon) -> [discounts]? {
        let beaconKey = "\(beacon.major):\(beacon.minor)"
        if let places = self.placesByBeacon![beaconKey] {
            //let sortedPlaces = Array(places)//.sort { $0.1 < $1.1 }.map { $0.0 }
            discountsData = places
            return discountsData
        }
        return nil
    }
    
    func beaconManager(_ manager: AnyObject, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let nearestBeacon = beacons.first, let places = placesNearBeacon(nearestBeacon) {
            
            
            self.tableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.discountsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usercell", for: indexpath)
        (cell.viewWithTag(2) as? UILabel)?.text = discountsData[(indexpath as NSIndexPath).row].name
        (cell.viewWithTag(3) as? UILabel)?.text = discountsData[(indexpath as NSIndexPath).row].discount
        (cell.viewWithTag(101) as? UILabel)?.text = discountsData[(indexpath as NSIndexPath).row].price
        (cell.viewWithTag(102) as? UILabel)?.text = discountsData[(indexpath as NSIndexPath).row].region
        switch discountsData[(indexpath as NSIndexPath).row].photo {
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
        
        let url = URL(string: urlString)
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { response in
            
            // print (urlString)
            let a = response.result.value as! NSArray
            
            
            for i in 1...a.count-1{
                
                var ids:String = ""
                var smallI:String = ""
                var largeI:String = ""
                var title:String = ""
                var pubDate:String = ""
                var teaser:String = ""
                var audioFile:String = ""
                let object =  a[i] as! Dictionary<String,AnyObject>
                
                if let title1 = object["name"] as? String {
                    ids = title1
                }
                
                if let title1 = object["photo"] as? String {
                    title = title1
                }
                
                if let pubDate1 = object["price"] as? String {
                    pubDate = pubDate1
                }
                
                
                if let smallImage = object["discount"] as? String {
                    smallI = smallImage
                }
                
                if let reg = object["region"] as? String {
                    largeI = reg
                    if(largeI == "produce"){
                        self.discProd.append(discounts(name:ids,photo: title,price: pubDate,discount: smallI,region: largeI))
                    }else if(largeI == "grocery"){
                        self.discGroc.append(discounts(name:ids,photo: title,price: pubDate,discount: smallI,region: largeI))
                    }else if(largeI == "lifestyle"){
                        self.discLife.append(discounts(name:ids,photo: title,price: pubDate,discount: smallI,region: largeI))
                    }
                }
                //  discountsData.append(discounts(name:ids,photo: title,price: pubDate,discount: smallI,region: largeI))
                //print(a[i] as! Dictionary<String,AnyObject>)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.beaconManager.startRangingBeacons(in: self.beaconRegion)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.beaconManager.stopRangingBeacons(in: self.beaconRegion)
        
    }


}

