//
//  PostViewController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 11/2/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var typeLabel: UITextField!
    @IBOutlet weak var locationLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
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
        
        
        
        
        let textView:UITextView! = UITextView()
        textView.frame = CGRectMake(0,header.frame.height,screenWidth,screenHeight*0.9)
        textView.editable = false
        self.view.addSubview(textView)
        
        
        
        let btnVoiceRecog = UIButton()
        
        btnVoiceRecog.frame = CGRectMake(100, 100, 100, 100)
        btnVoiceRecog.center = CGPointMake(textView.center.x,screenHeight-200)

        
        btnVoiceRecog.setImage(UIImage(named:"microphone.jpg"), forState: UIControlState.Normal)
        
      
        
        textView.addSubview(btnVoiceRecog)
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func submitButtonAction(sender: AnyObject) {
    }
    
    
    // MARK : - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
