//
//  SettingsViewController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 11/2/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var settingsTable: UITableView!
    
    let textCellIdentifier = "TextCell"
    let tableData = ["Account", "Help", "Privacy", "About", "Logout"]
    let tableIcon = ["account", "help", "privacy", "about", "logout"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
    
        //let screenHeight = UIScreen.mainScreen().bounds.height
        let screenWidth = UIScreen.mainScreen().bounds.width
        settingsView.frame = CGRectMake(0,20,screenWidth,settingsView.frame.height)
        
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
        let row = indexPath.row
        print(tableData[row])
        
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
