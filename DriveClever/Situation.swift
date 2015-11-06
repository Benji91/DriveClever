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
    var id = ""
    
    /*GPS Coordinates of a Situation provided by the phone*/
    var lat = 1.0
    var lng = 1.0
    
    /*Statistical Data of the situations created*/
    var createdBy = ""
    var createdDate = ""
    
    /*Type of a situation*/
    var type = "xy"
    
    /*Crisis is either open or closed*/
    var closed = false
    
    /*3 hits will increment the closeAttemps by 3 and close the crisis every time, otherwise decrement*/
    var closeAttempts = 0
    
    /* for type == "TrafficJam"*/
    var length = 0.0 // cf "Work"
    var reason = "" //Comment on traffic jam
    
    /* for type == "Control"*/
    var controlType = ""
    
    /* for type == "Danger"*/
    var comment = ""
    
    /* for type == "Work"*/
    //Double length; // ~ TrafficJam
    var jamPossibility = 0.0
    init(){
        
    }

    
}