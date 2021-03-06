//
//  ViewController.swift
//  DriveClever
//
//  Created by Ibrahim Tahirou on 10/25/15.
//  Copyright © 2015 Ibrahim Tahirou. All rights reserved.
//
// modified by Benjamin JAHIC on 10/25/15.

import UIKit
import MapKit


class HomeViewController: UIViewController, UITabBarDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    //@IBOutlet weak var mapView: MKMapView!
    let mapView = MKMapView()
    var timer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //Adding Mapview manually to the view and showing it with the Properties underneath
        mapView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        mapView.mapType = MKMapType.Standard
        mapView.zoomEnabled = true
        mapView.scrollEnabled = true
        mapView.showsUserLocation = true
        self.view.addSubview(mapView)
        
        //Adding a locationManager who hosts the location of the person
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        
        
        
    
    }
    
    override func viewDidAppear(animated: Bool) {
        let lat = self.locationManager.location!.coordinate.latitude
        let lng = self.locationManager.location!.coordinate.longitude
        APIAccess.requestSituations(AreaRequest(lat: lat, lng: lng,radius: 1000.0))

        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        sleep(5)
        let r = delegate.task?.result as! NSArray
        populate(r)
    }
    
    
    
    func populate(r:NSArray) {
        mapView.removeAnnotations(mapView.annotations)

        for dataObject : AnyObject in r
        {
            var annotation = MKPointAnnotation()
            
            let lat = dataObject["lat"] as! Double
            let long = dataObject["lng"] as! Double
            
            var location = CLLocationCoordinate2D(
                latitude: lat,
                longitude: long
            )
            
            annotation.coordinate = location
            let type = dataObject["type"] as! String
            annotation.title=type
            
                        
            mapView.addAnnotation(annotation)
            
        }
        
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*Update Locations*/
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        let lat=location!.coordinate.latitude
        let lng=location!.coordinate.longitude
        let center = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        
        //let center = CLLocationCoordinate2D(latitude: 49.626082, longitude: 6.159284)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009))
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    
    /*Error occured while localising*/
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Error: " + error.localizedDescription)
    }
    
}

