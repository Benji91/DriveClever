//
//  WarningViewController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 11/11/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.
//

import UIKit

class WarningViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
        }
    }
    
}
