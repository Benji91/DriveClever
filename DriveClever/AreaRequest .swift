//
//  AreaRequest .swift
//  DriveClever
//
//  Created by Gary Cornelius on 05/11/15.
//  Copyright © 2015 Jahic Benjamin. All rights reserved.
//

import Foundation

class AreaRequest {
    let lat,lng,radius:Double
    init(lat:Double,lng:Double,radius:Double){
        self.lat=lat
        self.lng=lng
        self.radius=radius;
    }
}