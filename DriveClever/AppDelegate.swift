//
//  AppDelegate.swift
//  DriveClever
//
//  Created by Jahic Benjamin on 16/10/15.
//  Copyright © 2015 Jahic Benjamin. All rights reserved.
//
import Foundation
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, PNObjectEventListener {
    
    var window: UIWindow?
    
    
    var client : PubNub
    var config : PNConfiguration
    
    override init() {
        config = PNConfiguration(publishKey: "pub-c-3a992903-bd4b-475b-a76e-bab6f2c23392", subscribeKey: "sub-c-4844d2d2-7e9a-11e5-a643-02ee2ddab7fe")
        client = PubNub.clientWithConfiguration(config)
        client.subscribeToChannels(["all"], withPresence: false)
        client.publish("Swift+PubNub!", toChannel: "all", compressed: false, withCompletion: nil)
        
        super.init()
        client.addListener(self)
    }
    
    func client(client: PubNub!, didReceiveMessage message: PNMessageResult!) {
        print(message)
    }
    
    func application(application: UIApplication,didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        AWSLogger.defaultLogger().logLevel = AWSLogLevel.Verbose
        let result = FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        return result
    }
    
    
    
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        
        let result = FBSDKApplicationDelegate.sharedInstance().application(app, openURL: url,  sourceApplication: options["UIApplicationOpenURLOptionsSourceApplicationKey"] as! String,
            annotation: nil)
        
        return result

    }
    
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

