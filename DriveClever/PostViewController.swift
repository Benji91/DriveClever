//
//  PostViewController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 11/2/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.
//

import UIKit
import AVFoundation

class PostViewController: UIViewController, UITextFieldDelegate,WitDelegate{
    
    let textView:UITextView! = UITextView()

    override func viewDidLoad() {
        let screenWidth = UIScreen.mainScreen().bounds.width
        let screenHeight = UIScreen.mainScreen().bounds.height
        self.view.backgroundColor = UIColor(red: 53/255, green: 166/255, blue: 165/255, alpha: 1)
        
        
        
        let header:UIView! = UIView()
        header.frame = CGRectMake(0,0,screenWidth,screenHeight*0.1)
        let headerColor = UIColor(red: 43/255, green: 134/255, blue: 133/255, alpha : 1)
        header.backgroundColor = headerColor
        self.view.addSubview(header)
        
        
        let label:UILabel! = UILabel()
        label.font = UIFont(descriptor: UIFontDescriptor(name: "Papyrus", size: 24), size: 24)
        label.textAlignment = NSTextAlignment.Center
        label.text = "Post"
        label.textColor = UIColor.blackColor()
        label.frame = CGRectMake(0,15,screenWidth,screenHeight*0.1)
        header.addSubview(label)
        
        
        textView.frame = CGRectMake(0,header.frame.height,screenWidth,screenHeight*0.9)
        textView.editable = false
        self.view.addSubview(textView)
        
        
     
        Wit.sharedInstance().delegate = self

        let btnVoiceRecog = WITMicButton()
        
        btnVoiceRecog.frame = CGRectMake(100, 100, 100, 100)
        btnVoiceRecog.center = CGPointMake(textView.center.x,screenHeight-200)

        
        textView.addSubview(btnVoiceRecog)
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func witDidGraspIntent(outcomes: [AnyObject]!, messageId: String!, customData: AnyObject!, error e: NSError!) {
        if ((e) != nil) {
            print("\(e.localizedDescription)")
            return
        }
        
        let outcomes : NSArray = outcomes!
        let firstOutcome : NSDictionary = outcomes.objectAtIndex(0) as! NSDictionary
        let intent : String = firstOutcome.objectForKey("intent")as! String
        textView.text = intent
        
        //labelView!.text = intent
        //labelView!.sizeToFit()
    }

    
    
    // MARK : - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
       
}
