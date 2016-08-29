//
//  ImageViewController.swift
//  Casini
//
//  Created by Kranthi Chinnakotla on 7/13/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UIScrollViewDelegate {
    
    var imageURL: NSURL?{
        didSet {
            image = nil
            if view.window != nil{
                fetchImage()}
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private  func fetchImage(){
        
        if let url = imageURL{
            spinner?.startAnimating()
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0))
            {
                let data = NSData(contentsOfURL: url)
                dispatch_async(dispatch_get_main_queue()) {
                    if url == self.imageURL{
                        if let imageData = data {
                            self.image = UIImage(data: imageData)
                        }
                        else{
                           self.spinner?.stopAnimating()
                        }
                    }
                    else{
                        print("ignored data returned from url \(url)")
                    }
                   
                }
                
                
            }
            
        }
        
    }
    
    private var imageView = UIImageView()
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private var image: UIImage? {
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil{
            fetchImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        //imageURL = NSURL(string: DemoURL.UNCC)
        
        // Do any additional setup after loading the view.
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
