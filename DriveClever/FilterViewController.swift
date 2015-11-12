//
//  FilterViewController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 11/2/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.
//

import UIKit
let debug = 1

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var filterTable: UITableView!
    
    let textCellIdentifier = "TextCell"
    let tableData = ["All", "Construction", "Radar", "Accident", "Traffic", "Breakdown"]
    let tableIcon = ["all_icon.png", "construction_icon.png", "radar_icon.png", "accident_icon.png", "traffics_icon.png", "breakdown_icon.png"]
    
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
