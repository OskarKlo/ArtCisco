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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyCME7Mf_L2u9vUBk05D8zDwN8rCn1SYfFI")
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
    }
}
