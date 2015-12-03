//
//  LoginViewController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 10/25/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    var loginButton = FBSDKLoginButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Default.png")!)
        let isIphone = (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone)
        let isIphone5 = isIphone && (UIScreen.mainScreen().bounds.size.height>480) && (UIScreen.mainScreen().bounds.size.height<667)
        let isIphone6 = isIphone && (UIScreen.mainScreen().bounds.size.height>568) && (UIScreen.mainScreen().bounds.size.height<736)
        let isIphone6Plus = isIphone && (UIScreen.mainScreen().bounds.size.height>667)
        var iphoneType = ""
        
        if(isIphone5){
           iphoneType="home5"
        }else{
            if(isIphone6){
                iphoneType="home6"
            }else{
                if(isIphone6Plus){
                    iphoneType="home6Plus"
                }else{
                    iphoneType="home4"
                }
            }
        }
        
        let bgImage = UIImageView(image: UIImage(named: iphoneType))
        self.view.addSubview(bgImage)

        let btnFBLogin = UIButton()
       
        btnFBLogin.frame = CGRectMake(100, 100, UIScreen.mainScreen().bounds.size.width*0.7, 50)
        btnFBLogin.center=self.view.center
       
        btnFBLogin.setImage(UIImage(named:"FBButtonSt"), forState: UIControlState.Normal)
        btnFBLogin.setImage(UIImage(named:"FBButtonHover"), forState: UIControlState.Highlighted)
        
        btnFBLogin.addTarget(self, action: "loginWithFacebookButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)

        
        btnFBLogin.contentHorizontalAlignment=UIControlContentHorizontalAlignment.Fill
        btnFBLogin.contentVerticalAlignment=UIControlContentVerticalAlignment.Fill
        
        self.view.addSubview(btnFBLogin)

        
        if(FBSDKAccessToken.currentAccessToken()==nil){
            print("Not logged in")
        }else{
            print("Logged in")
            APIAccess.connectToAmazonWebServices()
            //APIAccess.testAPI()
            APIAccess.requestSituations(AreaRequest(lat: 49.626082, lng:6.159284,radius: 1000.0))
            //APIAccess.requestArea(AreaRequest(lat: 49.626082, lng:6.159284,radius: 1.0))

            self.performSegueWithIdentifier("loginTabSegue", sender: self)
            
        }

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func loginWithFacebookButtonAction(sender: AnyObject) {
        
        let login = FBSDKLoginManager.init()
        login.logInWithReadPermissions(["public_profile"], fromViewController: self) { (FBSDKLoginManagerLoginResult result, NSError error) -> Void in
            if(error != nil) {
                print("Process error")
                print(error.localizedDescription)
                //This segue should be removed , I have used as Im not the authorised user for this app//---Facebook Login
                self.performSegueWithIdentifier("loginTabSegue", sender: self)
                
            }
            else if(result.isCancelled) {
                print("Cancelled")
            }
            else {
                print("Logged In")
                self.returnUserData()
                APIAccess.connectToAmazonWebServices()
                APIAccess.testAPI()
                self.performSegueWithIdentifier("loginTabSegue", sender: self)
            }
        }
    }
    
    //This will be used for login with FB default Button
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        if(error==nil){
            print("Login complete!")
            returnUserData()
            APIAccess.connectToAmazonWebServices()
            APIAccess.testAPI()
            self.performSegueWithIdentifier("loginTabSegue", sender: self)
            
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
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
