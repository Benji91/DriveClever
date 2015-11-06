//
//  SituationUpdateRequest.swift
//  DriveClever
//
//  Created by Gary Cornelius on 05/11/15.
//  Copyright © 2015 Jahic Benjamin. All rights reserved.
//

import Foundation

class SituationUpdateRequest {
    let situationId : String
    let closed : Bool
    
    init(situationId:String,closed:Bool) {
        self.situationId=situationId
        self.closed=closed
    }
}