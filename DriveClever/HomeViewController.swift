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
        let ann = CustomAnnotation.init(coordinate: CLLocationCoordinate2DMake(23.80665,90.37545), title: "Airport", subtitle: "Dhaka, Bangladesh", detailURL: NSURL(fileURLWithPath: ""))
        homeMap.addAnnotation(ann)
        
        let ann1 = CustomAnnotation.init(coordinate:CLLocationCoordinate2DMake(23.80648,90.37570), title: "Restaurant", subtitle: "Dhaka, Bangladesh", detailURL: NSURL(fileURLWithPath: ""))
        homeMap.addAnnotation(ann1)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //        super.viewWillAppear(true)
        //        let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(homeMap.userLocation.coordinate, 800, 800)
        //        homeMap.setRegion(region, animated: true)
    }
    
    
    
    // MARK: -CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
    }
    //http://stackoverflow.com/questions/22452509/find-nearest-annotations-from-user-location-ios
    //http://stackoverflow.com/questions/32310344/know-nearest-pin-in-a-mapview-from-current-location
    //http://www.johnmullins.co/blog/2014/08/14/location-tracker-with-maps/
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        //        let pins = mapView.annotations
        //        let currentLocation = mapView.userLocation.location!
        //
        //        let nearestPin: MKAnnotation? = pins.reduce((CLLocationDistanceMax, nil)) { (nearest, pin) in
        //            let coord = pin.coordinate
        //            let loc = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
        //            let distance = currentLocation.distanceFromLocation(loc)
        //            return distance < nearest.0 ? (distance, pin) : nearest
        //            }.1
        
        
        
        
        //
        if (annotation.isKindOfClass(CustomAnnotation)) {
            let customAnnotation = annotation as? CustomAnnotation
            //            mapView.translatesAutoresizingMaskIntoConstraints = false
            var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("CustomAnnotation") as MKAnnotationView!
            
            if (annotationView == nil) {
                annotationView = customAnnotation?.annotationView()
            } else {
                annotationView.annotation = annotation;
            }
            
            //            self.addBounceAnimationToView(annotationView)
            return annotationView
        } else {
            return nil
        }
    }
    
    func addBounceAnimationToView(view: UIView) {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale") as CAKeyframeAnimation
        bounceAnimation.values = [ 0.05, 1.1, 0.9, 1]
        
        let timingFunctions = NSMutableArray(capacity: bounceAnimation.values!.count)
        
        for var i = 0; i < bounceAnimation.values!.count; i++ {
            timingFunctions.addObject(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        }
        //        bounceAnimation.timingFunctions = timingFunctions
        bounceAnimation.removedOnCompletion = false
        
        view.layer.addAnimation(bounceAnimation, forKey: "bounce")
    }
    
    //    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView,
    //        calloutAccessoryControlTapped control: UIControl) {
    //
    //            if control == view.rightCalloutAccessoryView {
    //                print("Disclosure Pressed! \(view.annotation?.title)")
    //
    //                if let cpa = view.annotation as? CustomAnnotation {
    //                    print("cpa.imageName = \(cpa.title)")
    //                }
    //            }
    //
    //    }
    
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let capital = view.annotation as! CustomAnnotation!
        
        //        let capital = view.annotation as! Capital
        let placeName = capital.title
        //        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: "", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(ac, animated: true, completion: nil)
    }
    
    
}

