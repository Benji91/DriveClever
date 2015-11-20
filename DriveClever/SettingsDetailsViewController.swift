//
//  SettingsDetailsViewController.swift
//  DriveClever
//
//  Created by Administrator on 16/11/15.
//  Copyright © 2015 Jahic Benjamin. All rights reserved.
//


import UIKit

class SettingsDetailsViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var myWebView: UIWebView!
    var viewTitle : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        titleLbl.text = viewTitle
        
        let placeholder = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
        let aStr = String(format: "<div align='justify'>%@<div>",placeholder)
        myWebView.loadHTMLString(aStr, baseURL: nil)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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

