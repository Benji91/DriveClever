//
//  FilterViewController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 11/2/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.


import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let filterTable:UITableView! = UITableView()
    
    let textCellIdentifier = "TextCell"
    let tableData = ["All", "Construction", "Radar", "Accident", "Traffic", "Breakdown"]
    let tableIcon = ["all_icon.png", "construction_icon.png", "radar_icon.png", "accident_icon.png", "traffics_icon.png", "breakdown_icon.png"]
    
    
    override func viewDidLoad() {
        
        let screenWidth = UIScreen.mainScreen().bounds.width
        let screenHeight = UIScreen.mainScreen().bounds.height
        self.view.backgroundColor = UIColor(red: 53/255, green: 166/255, blue: 165/255, alpha: 1)
        
        let header:UIView! = UIView()
        header.frame = CGRectMake(0,0,screenWidth,screenHeight*0.1)
        let headerColor = UIColor(red: 43/255, green: 134/255, blue: 133/255, alpha : 1)
        header.backgroundColor = headerColor
        self.view.addSubview(header)
        
        let label:UILabel! = UILabel()
        label.font = UIFont(descriptor: UIFontDescriptor(name: "Papyrus", size: 24), size: 24)
        label.textAlignment = NSTextAlignment.Center
        label.text = "Filter"
        label.textColor = UIColor.blackColor()
        label.frame = CGRectMake(0,15,screenWidth,screenHeight*0.1)
        header.addSubview(label)
        
        
        filterTable.frame = CGRectMake(0,header.frame.height,screenWidth,screenHeight*0.9)
        filterTable.backgroundColor = UIColor(red: 53/255, green: 166/255, blue: 165/255, alpha: 1)
        filterTable.delegate = self
        filterTable.dataSource = self
        filterTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TextCell")
        filterTable.separatorStyle = UITableViewCellSeparatorStyle.None

        self.view.addSubview(filterTable)
        
        
        super.viewDidLoad()
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
        cell.selectionStyle = UITableViewCellSelectionStyle.Default
        cell.backgroundColor = UIColor(red: 53/255, green: 166/255, blue: 165/255, alpha: 1)
        let row = indexPath.row
        
        cell.frame.size=CGSizeMake(UIScreen.mainScreen().bounds.width,60)
        cell.textLabel!.text=tableData[row]
        cell.textLabel?.font = UIFont(descriptor: UIFontDescriptor(name: "Papyrus", size: 18), size: 18)
        
        let imgView = cell.imageView
        let color = UIColor.blackColor()
        imgView!.layer.borderColor = color.CGColor
        imgView!.frame.size = CGSizeMake(60,60)
        imgView!.layer.cornerRadius  = 3
        imgView!.layer.borderWidth = 1
        imgView!.layer.backgroundColor = UIColor.whiteColor().CGColor
    
        let imageName = UIImage(named: tableIcon[indexPath.row])
        imgView!.image = imageName
       
        return cell
        
    }
    
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }*/
    
    
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
