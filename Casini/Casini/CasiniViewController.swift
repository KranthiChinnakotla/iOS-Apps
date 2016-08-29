//
//  CasiniViewController.swift
//  Casini
//
//  Created by Kranthi Chinnakotla on 7/14/16.
//  Copyright © 2016 edu.uncc.cs6010. All rights reserved.
//

import UIKit

class CasiniViewController: UIViewController,UISplitViewControllerDelegate {

    
    private struct Storyboard{
        static var ShowImage = "ShowImage"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == Storyboard.ShowImage{
            if let ivc = segue.destinationViewController.contentViewController as? ImageViewController {
                let imageName = (sender as? UIButton)?.currentTitle
                ivc.imageURL = DemoURL.imageName(imageName)
                ivc.title = imageName
            }
        }
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        if primaryViewController.contentViewController == self{
            if let ivc = secondaryViewController.contentViewController as? ImageViewController where ivc.imageURL == nil {
                return true
            }
            }
        return false
        }
    }
    



extension UIViewController{
    var contentViewController: UIViewController{
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        }else {
            return self
        }
    }
}
