//
//  WarningViewController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 11/11/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.
//
/*
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

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/

}*/
import UIKit
import MapKit


class WarningViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var breakDownBtn: UIButton!
    @IBOutlet weak var trafficBtn: UIButton!
    @IBOutlet weak var radarBtn: UIButton!
    @IBOutlet weak var constructionBtn: UIButton!
    @IBOutlet weak var accidentBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 5
        containerView.layer.borderColor = UIColor.orangeColor().CGColor
        
        
        breakDownBtn.layer.cornerRadius = 5
        breakDownBtn.layer.borderWidth = 2
        breakDownBtn.layer.borderColor = UIColor.whiteColor().CGColor
        
        trafficBtn.layer.cornerRadius = 5
        trafficBtn.layer.borderWidth = 2
        trafficBtn.layer.borderColor = UIColor.whiteColor().CGColor
        
        radarBtn.layer.cornerRadius = 5
        radarBtn.layer.borderWidth = 2
        radarBtn.layer.borderColor = UIColor.whiteColor().CGColor
        
        constructionBtn.layer.cornerRadius = 5
        constructionBtn.layer.borderWidth = 2
        constructionBtn.layer.borderColor = UIColor.whiteColor().CGColor
        
        accidentBtn.layer.cornerRadius = 5
        accidentBtn.layer.borderWidth = 2
        accidentBtn.layer.borderColor = UIColor.whiteColor().CGColor
        
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
    
    
    
    @IBAction func buttonAction(sender: AnyObject) {
        //let hVC = self.storyboard?.instantiateViewControllerWithIdentifier("homeView") as! HomeViewController
        //        hVC.addAnnotationInmyLocation("Custom", subtitle: "Custom Annotation", address: "My Location")
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

