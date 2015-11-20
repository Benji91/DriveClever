//
//  FilterViewController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 11/2/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.


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
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        let row = indexPath.row
        let label = self.view.viewWithTag(2) as? UILabel
        label?.text = tableData[row]
        let imgView = self.view.viewWithTag(1) as? UIImageView
        imgView?.image = UIImage(named: tableIcon[row])
        
        imgView!.backgroundColor = UIColor.whiteColor()
        imgView!.layer.cornerRadius = (imgView?.frame.size.width)!/2
        imgView!.layer.borderWidth = 3
        let color = UIColor(red: 0.239, green: 0.800, blue: 0.643, alpha: 1.0)
        imgView!.layer.borderColor = color.CGColor
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if(indexPath.row == 0){
            let cell = tableView.visibleCells[0]
            for(var i = 1; i < tableData.count ; i++){
                let otherCell = tableView.visibleCells[i]
                if (cell.accessoryType == UITableViewCellAccessoryType.None){
                    otherCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                    if i == tableData.count-1 {
                        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                    }
                }
                else {
                    otherCell.accessoryType = UITableViewCellAccessoryType.None
                    if i == tableData.count-1 {
                        cell.accessoryType = UITableViewCellAccessoryType.None
                    }
                    
                }
            }
        }
        else {
            let index = tableView.indexPathsForVisibleRows?.indexOf(indexPath)
            if (index != NSNotFound) {
                let cell = tableView.visibleCells[indexPath.row]
                if (cell.accessoryType == UITableViewCellAccessoryType.None){
                    cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                }
                else {
                    cell.accessoryType = UITableViewCellAccessoryType.None
                }
            }
        }
        filterTable.reloadData()
    }
    
    
}
