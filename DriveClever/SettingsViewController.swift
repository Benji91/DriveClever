//
//  SettingsViewController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 11/2/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.
//

import UIKit
import MessageUI

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var settingsTable: UITableView!
    let textCellIdentifier = "TextCell"
    let tableData = ["Delete Account", "Help", "Privacy", "About", "Logout"]
    let tableIcon = ["account", "help", "privacy", "about", "logout"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        let label = self.view.viewWithTag(2) as? UILabel
        label?.text = tableData[row]
        let imgView = self.view.viewWithTag(1) as? UIImageView
        imgView?.image = UIImage(named: tableIcon[row])
        
        imgView!.backgroundColor = UIColor.whiteColor()
        imgView!.layer.cornerRadius = 8
        imgView!.layer.borderWidth = 2
        imgView!.layer.borderColor = UIColor.whiteColor().CGColor
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if(indexPath.row == 0){
            self.createAlert("Delete Account!", message: "Do you really want to delete your account?")
            
        }
        else if(indexPath.row == 1){
            // HELP PRESSED
            print("Help.")
            let mailComposeViewController = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail(){
                self.presentViewController(mailComposeViewController, animated: true, completion: nil)
                
            }
            else {
            self.showSendMailErrorAlert()
            }
            
            
        }
        else if(indexPath.row == 4){
            //            self.createAlert("Logout", message: "Do you really want to logout?")
            self.showActionSheet(tableData[indexPath.row])
            
        }else{
            let sDVC = self.storyboard?.instantiateViewControllerWithIdentifier("settingDetailsView") as! SettingsDetailsViewController
            sDVC.viewTitle = tableData[indexPath.row]
            self.presentViewController(sDVC, animated: true, completion: nil)
        }
    }
    
    func createAlert (title:String, message : String) {
        
        // Create the alert controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Mail couldn't be send.", message: "You'r device was unable to send this e-mail. Please try again.", delegate:self, cancelButtonTitle:"OK")
        sendMailErrorAlert.show()
        
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController{
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate=self
        mailComposerVC.setToRecipients(["info@drive-clever.lu"])
        mailComposerVC.setSubject("User - Help")
        mailComposerVC.setMessageBody("", isHTML:false)
        return mailComposerVC
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        switch result {
        case MFMailComposeResultCancelled: print("Mail canceled.")
        case MFMailComposeResultSent: print("Mail sent.")
        default: break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showActionSheet(type: String) {
        var btnTitle_1:String?
        if(type == "Privacy"){
            btnTitle_1 = "Turn On Location"
        }
        else {
            btnTitle_1 = "Logout"
        }
        
        
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let deleteAction = UIAlertAction(title:btnTitle_1, style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Deleted")
        })
        let saveAction = UIAlertAction(title: "Turn Off Location", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Done")
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        
        optionMenu.addAction(deleteAction)
        if(type == "Privacy"){
            optionMenu.addAction(saveAction)
        }
        optionMenu.addAction(cancelAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
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
