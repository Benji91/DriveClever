//
//  APIAccess.swift
//  DriveClever
//
//  Created by Jahic Benjamin on 30/10/15.
//  Copyright © 2015 Jahic Benjamin. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

class APIAccess{
    
       /*FUNCTION INITIALISATION OF THE FACEBOOK ID AND API AWS CONNECTION
    - no parameter
    - no return statement
    */
    class func connectToAmazonWebServices(){

        /*Credentials for login defined in Constants.swift*/
        let credentialProvider = AWSCognitoCredentialsProvider(regionType: CognitoRegionType, identityPoolId: CognitoIdentityPoolId)
        
        /*Facebook token needed for link between AWS and Facebook*/
        let token: String = FBSDKAccessToken.currentAccessToken().tokenString
        
        /*The actual login*/
        let logins: NSDictionary = NSDictionary(dictionary: ["graph.facebook.com" : token])
        
        /*matching login with the credentialProvider*/
        credentialProvider.logins = logins as [NSObject : AnyObject]
        
        /*Providing a configuration to log in with the AWS Services*/
        let configuration = AWSServiceConfiguration(region: DefaultServiceRegionType, credentialsProvider: credentialProvider)
        
        /*Store service in manager*/
        AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration
    }
    
    /*
        Test function to check if there is a response of the AWS Services
            -no param
            -no return
    */
    class func testAPI(){
        
        /*Keys inside the test api functions need to be initalized some how*/
        let firstName = "John"
        let lastName = "TheTester"
        
        
        var resultTask = AWSTask()
        
        func setResultTask(task:AWSTask){
            resultTask=task
        }
        
        /*invoke lambda function asynchronously*/
        NSLog("Invoking lambda function for firtsname=\(firstName) for lastname=\(lastName)")
        let lambdaInvoker = AWSLambdaInvoker.defaultLambdaInvoker()
        
        /*New task to call the testAPI function (the function call)*/
        let task = lambdaInvoker.invokeFunction("testAPI", JSONObject: ["firstName":firstName ,"lastName":lastName])
        
        /*Handling the result optained of the function call*/
        task.continueWithBlock({ (task: AWSTask!) -> AWSTask! in
            if (task.error != nil) { // NO ERROR OCCURES
                NSLog("Invoke Lambda returned an error : \(task.error)")
                dispatch_async(dispatch_get_main_queue(), {
                    
                    //self.greeting.text = "Error"
                    //self.deviceType.text = task.error.description
                    //SVProgressHUD.dismiss()
                })
            }
            else {
                if (task.result != nil) { //WE HAVE A KNOWN RESULT
                    
                    NSLog("Invoke Lambda : result = \(task.result)")
                    //upate text label on the main UI thread if there is anyy
                    setResultTask(task)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        //let r = task.result as! Dictionary<String,String>
                        //self.greeting.text = r["message"]
                        //self.deviceType.text = r["device"]
                        //SVProgressHUD.dismiss()
                    })
                    return task
                    
                }
                else { //WE HAVE A UNKNOWS RESULT
                    
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
        
        sleep(5)
        /*Final RESULT*/
        print("Invoke 2 Lambda : result = \(task.result)")
        
    }
    
    /*
    * Request all situations around a certain area.
    */
    class func requestSituations(req : AreaRequest) -> Bool{
        
        /*invoke lambda function asynchronously*/
        NSLog("Invoking lambda function for requesting a situation")
        let lambdaInvoker = AWSLambdaInvoker.defaultLambdaInvoker()
        
        /*New task to call the testAPI function (the function call)*/
        let task = lambdaInvoker.invokeFunction("testAPI",JSONObject: [])
        
        /*Handling the result optained of the function call*/
        task.continueWithBlock(
            {
                
                (task: AWSTask!) -> AWSTask! in
                
                if (task.error != nil) { // NO ERROR OCCURES
                    NSLog("Invoke Lambda returned an error : \(task.error)")
                    dispatch_async(dispatch_get_main_queue(), {
                        //self.greeting.text = "Error"
                        //self.deviceType.text = task.error.description
                        //SVProgressHUD.dismiss()
                    })
                }
                else {
                    if (task.result != nil) { //WE HAVE A KNOWN RESULT
                        
                        NSLog("Invoke Lambda : result = \(task.result)")
                        
                        //upate text label on the main UI thread if there is anyy
                        dispatch_async(dispatch_get_main_queue(), {
                            //let r = task.result as! Dictionary<String,String>
                            //self.greeting.text = r["message"]
                            //self.deviceType.text = r["device"]
                            //SVProgressHUD.dismiss()
                        })
                        
                    }
                    else { //WE HAVE A UNKNOWS RESULT
                        
                        NSLog("Invoke Lambda : unknow result : \(task)");
                        NSLog("Exception : \(task.exception)")
                        NSLog("Error : \(task.error)" )
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            //self.greeting.text = "Error"
                            //SVProgressHUD.dismiss()
                        })
                    }
                }
                return task
        })
        
        
        return ""
        
    }

    
    /*
    * Callback function if results were received.
    */
    class func requestSituationsResponse(task:AWSTask) {
        print(task.result)
    }
    
    
    /*
    * Request all AreaResponses around a certain area.
    */
    class func requestArea(req:AreaRequest) -> Bool {
        /*invoke lambda function asynchronously*/
        NSLog("Invoking lambda function for requesting a situation")
        let lambdaInvoker = AWSLambdaInvoker.defaultLambdaInvoker()
        
        /*New task to call the testAPI function (the function call)*/
        let task = lambdaInvoker.invokeFunction("requestArea",JSONObject: ["lat":req.lat,"lng":req.lng,"radius":req.radius])
        
        /*Handling the result optained of the function call*/
        task.continueWithBlock(
            {
                
                (task: AWSTask!) -> AWSTask! in
                
                if (task.error != nil) { // NO ERROR OCCURES
                    NSLog("Invoke Lambda returned an error : \(task.error)")
                    dispatch_async(dispatch_get_main_queue(), {
                        //self.greeting.text = "Error"
                        //self.deviceType.text = task.error.description
                        //SVProgressHUD.dismiss()
                    })
                }
                else {
                    if (task.result != nil) { //WE HAVE A KNOWN RESULT
                        
                        //NSLog("Invoke Lambda : result = \(task.result)")
                        
                        //upate text label on the main UI thread if there is anyy
                        dispatch_async(dispatch_get_main_queue(), {
                            //let r = task.result as! Dictionary<String,String>
                            //self.greeting.text = r["message"]
                            //self.deviceType.text = r["device"]
                            //SVProgressHUD.dismiss()
                        })
                        requestAreaResponse(task)
                        
                    }
                    else { //WE HAVE A UNKNOWS RESULT
                        
                        NSLog("Invoke Lambda : unknow result : \(task)");
                        NSLog("Exception : \(task.exception)")
                        NSLog("Error : \(task.error)" )
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            //self.greeting.text = "Error"
                            //SVProgressHUD.dismiss()
                        })
                    }
                }
                return task
        })
        
        
        return true
    }
    
    /*
    * Callback function if results were received.
    */
    class func requestAreaResponse(task:AWSTask) {
        print(task.result)
    }
    
    
    
    class func reportSituation(sit:Situation) ->Bool{
        /*invoke lambda function asynchronously*/
        NSLog("Invoking lambda function for requesting a situation")
        let lambdaInvoker = AWSLambdaInvoker.defaultLambdaInvoker()
        
        /*New task to call the testAPI function (the function call)*/
        let task = lambdaInvoker.invokeFunction("reportSituation",JSONObject: ["lat":sit.lat,"lng":sit.lng,"type":sit.type])
        
        /*Handling the result optained of the function call*/
        task.continueWithBlock(
            {
                
                (task: AWSTask!) -> AWSTask! in
                
                if (task.error != nil) { // NO ERROR OCCURES
                    NSLog("Invoke Lambda returned an error : \(task.error)")
                    dispatch_async(dispatch_get_main_queue(), {
                        //self.greeting.text = "Error"
                        //self.deviceType.text = task.error.description
                        //SVProgressHUD.dismiss()
                    })
                }
                else {
                    if (task.result != nil) { //WE HAVE A KNOWN RESULT
                        
                        //NSLog("Invoke Lambda : result = \(task.result)")
                        
                        //upate text label on the main UI thread if there is anyy
                        dispatch_async(dispatch_get_main_queue(), {
                            //let r = task.result as! Dictionary<String,String>
                            //self.greeting.text = r["message"]
                            //self.deviceType.text = r["device"]
                            //SVProgressHUD.dismiss()
                        })
                        reportSituationResponse(task)
                        
                    }
                    else { //WE HAVE A UNKNOWS RESULT
                        
                        NSLog("Invoke Lambda : unknow result : \(task)");
                        NSLog("Exception : \(task.exception)")
                        NSLog("Error : \(task.error)" )
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            //self.greeting.text = "Error"
                            //SVProgressHUD.dismiss()
                        })
                    }
                }
                return task
        })
        
        
        return true
    }
    
    class func reportSituationResponse(task:AWSTask)   {
        print(task.result)
    }
    
    class func updateSituation(sur:SituationUpdateRequest) ->Bool{
        /*invoke lambda function asynchronously*/
        NSLog("Invoking lambda function for requesting a situation")
        let lambdaInvoker = AWSLambdaInvoker.defaultLambdaInvoker()
        
        /*New task to call the testAPI function (the function call)*/
        let task = lambdaInvoker.invokeFunction("updateSituation",JSONObject: ["situationId":sur.situationId,"closed":sur.closed])
        
        /*Handling the result optained of the function call*/
        task.continueWithBlock(
            {
                
                (task: AWSTask!) -> AWSTask! in
                
                if (task.error != nil) { // NO ERROR OCCURES
                    NSLog("Invoke Lambda returned an error : \(task.error)")
                    dispatch_async(dispatch_get_main_queue(), {
                        //self.greeting.text = "Error"
                        //self.deviceType.text = task.error.description
                        //SVProgressHUD.dismiss()
                    })
                }
                else {
                    if (task.result != nil) { //WE HAVE A KNOWN RESULT
                        
                        //NSLog("Invoke Lambda : result = \(task.result)")
                        
                        //upate text label on the main UI thread if there is anyy
                        dispatch_async(dispatch_get_main_queue(), {
                            //let r = task.result as! Dictionary<String,String>
                            //self.greeting.text = r["message"]
                            //self.deviceType.text = r["device"]
                            //SVProgressHUD.dismiss()
                        })
                        updateSituationResponse(task)
                        
                    }
                    else { //WE HAVE A UNKNOWS RESULT
                        
                        NSLog("Invoke Lambda : unknow result : \(task)");
                        NSLog("Exception : \(task.exception)")
                        NSLog("Error : \(task.error)" )
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            //self.greeting.text = "Error"
                            //SVProgressHUD.dismiss()
                        })
                    }
                }
                return task
        })
        
        
        return true
    }
    
    class func updateSituationResponse(task:AWSTask)   {
        print(task.result)
    }
    
  
    
    
    
}