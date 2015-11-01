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
        
        returnUserData()

        
        
        
        
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: CognitoRegionType, identityPoolId: CognitoIdentityPoolId)
        
        
        let token: String = FBSDKAccessToken.currentAccessToken().tokenString
        let logins: NSDictionary = NSDictionary(dictionary: ["graph.facebook.com" : token])
        
        credentialProvider.logins = logins as [NSObject : AnyObject]
        
        let configuration = AWSServiceConfiguration(region: DefaultServiceRegionType, credentialsProvider: credentialProvider)
        
        
        AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration
        
        
        
        let firstName = "Pede"
        let lastName = "encule"
        //invoke lambda function asynchronously
        NSLog("Invoking lambda function for firtsname=\(firstName) for lastname=\(lastName)")
        let lambdaInvoker = AWSLambdaInvoker.defaultLambdaInvoker()
        let task = lambdaInvoker.invokeFunction("testAPI", JSONObject: ["firstName":firstName ,"lastName":lastName])
        task.continueWithBlock({ (task: AWSTask!) -> AWSTask! in
            
            if (task.error != nil) {
                NSLog("Invoke Lambda returned an error : \(task.error)")
                dispatch_async(dispatch_get_main_queue(), {
                    //self.greeting.text = "Error"
                    //self.deviceType.text = task.error.description
                    //SVProgressHUD.dismiss()
                })
            }
            else {
                if (task.result != nil) {
                    NSLog("Invoke Lambda : result = \(task.result)")
                    
                    //upate text label on the main UI thread
                    dispatch_async(dispatch_get_main_queue(), {
                        //let r = task.result as! Dictionary<String,String>
                        //self.greeting.text = r["message"]
                        //self.deviceType.text = r["device"]
                        //SVProgressHUD.dismiss()
                    })
                    
                } else {
                    NSLog("Invoke Lambda : unknow result : \(task)");
                    NSLog("Exception : \(task.exception)")
                    NSLog("Error : \(task.error)" )
                    dispatch_async(dispatch_get_main_queue(), {
                        //self.greeting.text = "Error"
                        //SVProgressHUD.dismiss()
                    })
                }
            }
            return nil
            
        })
        
        
        
        

        
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

