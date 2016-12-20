//
//  AppleMapViewController.swift
//  ArtCisco7.0
//
//  Created by Oskar on 12/20/16.
//  Copyright © 2016 Oskar/Jake. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class AppleMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
