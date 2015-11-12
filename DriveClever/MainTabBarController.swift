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
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        
        var result:Bool = true
        
        if viewController.isKindOfClass(WarningViewController){
            result = false
            
            print("@___________________WarningViewController")
            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("warningView") as! WarningViewController
            vc.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
            self.presentViewController(vc, animated: true, completion: { () -> Void in
                
                self.presentedViewController?.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
                
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
