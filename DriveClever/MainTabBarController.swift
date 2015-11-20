//
//  MainTabBarController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 11/11/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.
//



import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        tabBarController.selectedIndex = 0
        
        var result:Bool = true
        
        if viewController.isKindOfClass(WarningViewController){
            result = false
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("warningView") as! WarningViewController
            vc.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
            
            self.presentViewController(vc, animated: true, completion: { () -> Void in
            })
            
        }
        
        return result
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

