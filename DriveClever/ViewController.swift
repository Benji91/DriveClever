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
            returnUserData()
        }else{
            print("ERROR")
            print(error.localizedDescription)
        }
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User logged out...")
    }
    
    
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
                //let userEmail : NSString = result.valueForKey("email") as! NSString
                //print("User Email is: \(userEmail)")
            }
        })
    }
}

