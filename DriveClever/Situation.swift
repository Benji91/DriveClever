//
//  Situation.swift
//  DriveClever
//
//  Created by Jahic Benjamin on 02/11/15.
//  Copyright © 2015 Jahic Benjamin. All rights reserved.
//

import Foundation

class Situation{
    
    /*identification number for the database*/
    var id:String
    
    /*GPS Coordinates of a Situation provided by the phone*/
    var lat:Double
    var lng:Double
    
    /*Statistical Data of the situations created*/
    var createdBy:String
    var createdDate:String
    
    /*Type of a situation*/
    var type:String
    
    /*Crisis is either open or closed*/
    var closed:Bool
    
    /*3 hits will increment the closeAttemps by 3 and close the crisis every time, otherwise decrement*/
    var closeAttempts:Int
    
    /* for type == "TrafficJam"*/
    var length:Double // cf "Work"
    var reason:String //Comment on traffic jam
    
    /* for type == "Control"*/
    var controlType:String
    
    /* for type == "Danger"*/
    var comment:String
    
    /* for type == "Work"*/
    //Double length; // ~ TrafficJam
    
    var jamPossibility:Double
    init(id:String,lat:Double, lng:Double, createdBy:String, createdDate:String,type:String,closed:Bool,closeAttempts:Int,length:Double,reason:String,controlType:String,comment:String,jamPossibility:Double){
        self.id=id
        self.lat=lat
        self.lng=lng
        self.createdBy=createdBy
        self.createdDate=createdDate
        self.type=type
        self.closed=closed
        self.closeAttempts=closeAttempts
        self.length=length
        self.reason=reason
        self.controlType=controlType
        self.comment=comment
        self.jamPossibility=jamPossibility
        
    }
    
    
}