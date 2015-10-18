//
//  FirstViewController.swift
//  DriveClever
//
//  Created by Jahic Benjamin on 16/10/15.
//  Copyright © 2015 Jahic Benjamin. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class ViewController: UIViewController,FBSDKLoginButtonDelegate {
    var loginButton = FBSDKLoginButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(FBSDKAccessToken.currentAccessToken()==nil){
            print("Not logged in")
        }else{
            print("Logged in")
        }
        
        loginButton = FBSDKLoginButton()
        loginButton.readPermissions=["public_profile","email","user_friends"]
        loginButton.center=self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        if(error==nil){
            print("Login complete!")
            self.performSegueWithIdentifier("showNew", sender: self)
        }else{
            print(error.localizedDescription)
        }
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User logged out...")
    }
}

