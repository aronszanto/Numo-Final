//
//  AccountCreationViewController.swift
//  Numo
//
//  Created by Austin King on 12/2/14.
//  Copyright (c) 2014 NorthShoreApps. All rights reserved.
//

import Foundation
import UIKit

class AccountCreationViewController: UIViewController {
    
    @IBOutlet weak var PromptLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PhoneLabel: UILabel!
    @IBOutlet weak var PhoneExampleLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    
    @IBOutlet weak var NameTextBox: UITextField!
    @IBOutlet weak var PhoneTextBox: UITextField!
    @IBOutlet weak var EmailTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}