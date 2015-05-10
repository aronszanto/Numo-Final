//
//  LaunchViewViewController.swift
//  Numo
//
//  Created by Numo on 12/2/14.
//  Copyright (c) 2014 Numo LLC. All rights reserved.
//

import Foundation
import UIKit

class LaunchViewController: UIViewController {
    
    // enables colors for background gradient
    let colors = Colors()
    
    override func viewDidAppear(animated: Bool) {
        
        // places gradient on the background
        view.backgroundColor = UIColor.clearColor()
        var backgroundLayer = colors.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
        
        
        if let details = NSUserDefaults.standardUserDefaults().objectForKey("phone") {
            let cur : PFObject = AddContactHelper.GetCurrentUserPFObject()
            cur["findable"] = false
            cur.save()
            // We already have details
            NSLog("Found: %@", details as NSString)
            
        }
        else {

        let promptView = self.storyboard?.instantiateViewControllerWithIdentifier("promptView") as PromptViewController
        self.navigationController?.pushViewController(promptView, animated: true)
        NSLog("Prompting for info")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}











