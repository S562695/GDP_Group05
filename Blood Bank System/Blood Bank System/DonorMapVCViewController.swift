//
//  DonorMapVCViewController.swift
//  Blood Bank System
//
//  Created by Naga Lakshmi on 11/30/23.
//

import UIKit
import MapKit
import CoreLocation

class DonorMapVCViewController: UIViewController, CLLocationManagerDelegate {
    private let map: MKMapView = {
        let map = MKMapView()
        return map
    }()
    private let scheduleButton: UIButton = {
            let button = UIButton()
            button.setTitle("Schedule", for: .normal)
            button.backgroundColor = .systemBlue
            button.addTarget(self, action: #selector(scheduleButtonTapped), for: .touchUpInside)
            return button
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview (map)
        view.addSubview(scheduleButton)
        title = "Select a map to view information"
        LocationManager.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
                strongSelf.addMapPin(with: location)
            }
        }
    }
    override func viewDidLayoutSubviews () {
        super.viewDidLayoutSubviews ()
        map.frame = view.bounds
        let buttonHeight: CGFloat = 50
                scheduleButton.frame = CGRect(x: 0,
                                              y: view.bounds.height - buttonHeight,
                                              width: view.bounds.width,
                                              height: buttonHeight)
    }
    func addMapPin(with location: CLLocation) {
        let pin = MKPointAnnotation ()
        pin.coordinate = location.coordinate
        map.setRegion (MKCoordinateRegion(center: location.coordinate,
                                          span: MKCoordinateSpan(
                                            latitudeDelta: 0.7,
                                            longitudeDelta: 0.7)
                                        ),
            animated: true)
        map.addAnnotation (pin)
        LocationManager.shared.resolveLocationName (with: location) { [weak self] locationName in
            self?.title = locationName
        }
    }
    @objc private func scheduleButtonTapped() {
            // Add your scheduling logic here
            print("Schedule button tapped!")
        }
}
