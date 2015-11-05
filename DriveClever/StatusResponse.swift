//
//  StatusReport.swift
//  DriveClever
//
//  Created by Gary Cornelius on 05/11/15.
//  Copyright © 2015 Jahic Benjamin. All rights reserved.
//

import Foundation

class StatusResponse{
    let msg,debug:String
    init(msg:String,debug:String) {
        self.msg=msg
        self.debug=debug
    }
}
