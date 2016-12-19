//
//  MapViewController.swift
//  
//
//  Created by Oskar on 12/19/16.
//
//

import Foundation
import UIKit
import GoogleMaps

class MapViewController: UIViewController {
        
        var locationManager = CLLocationManager()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            GMSServices.provideAPIKey("AIzaSyDOXZPIVoUtMiXGKujfG1m-pJHQTfvghIc")
            let camera = GMSCameraPosition.camera(withLatitude: 33.4436,
                                                  longitude: 115.4392, zoom: 10)
            let mapView = GMSMapView.map(withFrame: CGRect(x: 0,y: 0, width: 200, height: 200), camera: camera)
            mapView.isMyLocationEnabled = true
            view = mapView
    }
}

