//
//  ApplicationJson.swift
//  InClass06
//
//  Created by Kranthi Chinnakotla on 7/21/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import Foundation

class ApplicationJson{
    
    var appList = [Application]()
    
    func parseJson(url: String,completion: (app:[Application])->Void) -> Void {
        let nprUrl = NSURL(string: url)
        let session = NSURLSession.sharedSession()
        var jsonObject : Dictionary<String,AnyObject>?
        let task = session.dataTaskWithURL(nprUrl!) { (data, response, error) in
            
            if (error != nil){
                print(error?.localizedDescription)
            }else{
                do {  jsonObject = try (NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)  as? Dictionary<String, AnyObject>) }
                catch{
                    
                    
                    
                    
                }
            }
            
            guard let root = jsonObject else {
                return
            }
            guard let apps = root["feed"] as? Array<AnyObject> else {
                return
            }
            
            for ap in apps {
                var app = Application()
                if let apDict = ap as? Dictionary<String,AnyObject>{
                    if let id = apDict["category"] as? Dictionary<String,AnyObject>{
                        if let atrbts = id["attributes"] as? Dictionary<String,String>{
                            app.categories=atrbts["term"]!
                        }
                    }
                    
                }
                if let apDict = ap as? Dictionary<String,AnyObject> {
                    if let id = apDict["name"] as? Dictionary<String,String>{
                          app.title = id["label"]!
                    }
                    if let id = apDict["artist"] as? Dictionary<String,String>{
                        app.artist = id["label"]!
                    }
                    
                    if (apDict["otherImage"] as? NSNull) == nil{
                        
                        let id = apDict["otherImage"] as? Array<AnyObject>
                        for val in id!{
                            if let a = val as? Dictionary<String,String>{
                                app.largeImage = a["label"]!
                            }
                        }
                        
                       // print("its not nil " + (apDict["otherImage"] as? String)! )
                        }  
                    
                    
                    if let id = apDict["releaseDate"] as? Dictionary<String,String>{
                        app.releaseDate = id["label"]!
                    }
                    if let id = apDict["summary"] as? Dictionary<String,String> {
                        app.summary = id["label"]
                    } else {
                        app.summary = nil
                    }
                    if let id = apDict["price"] as? Dictionary<String,Double>{
                        app.price = id["amount"]!
                    }
                    
                    if let id = apDict["squareImage"] as? Array<AnyObject>{
                        for val in id{
                            if let a = val as? Dictionary<String,String>{
                                app.smallImage = a["label"]!
                            }
                        }
                    }
                    

                    
                }
                
                
                self.appList.append(app)
                
            }
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                completion(app:  self.appList)
            })
            
            
        }
        
        task.resume()
        
        
        
        
    }

}