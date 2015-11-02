//
//  ViewController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 10/25/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.
//

import UIKit
import MapKit


class HomeViewController: UIViewController, UITabBarDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var homeMap: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        homeMap.showsUserLocation = true
        homeMap.delegate = self;
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.distanceFilter = kCLDistanceFilterNone;
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // MARK: -CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(homeMap.userLocation.coordinate, 800, 800)
        homeMap.setRegion(region, animated: true)
    }
    

}

