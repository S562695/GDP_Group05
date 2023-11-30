//
//  DonorMapVCViewController.swift
//  Blood Bank System
//
//  Created by Naga Lakshmi on 11/30/23.
//

import UIKit
import MapKit
import CoreLocation

class DonorMapVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        // Do any additional setup after loading the view.
    }
    fileprivate let locationManager : CLLocationManager = CLLocationManager()
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
