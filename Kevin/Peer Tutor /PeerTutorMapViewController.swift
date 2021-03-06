//
//  PeerTutorMapViewController.swift
//  Kevin
//
//  Created by Victoria Knight on 2/9/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class PeerTutorMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
  
    @IBOutlet weak var mapView: MKMapView!
   
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(backAction))
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let centerLocation = CLLocation(latitude: 43.1948, longitude: -71.5734)
        
        let regionSpan: CLLocationDistance = 500
        func centerMapOnLocation(location: CLLocation) {
            let selectedRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionSpan, regionSpan)
            mapView.setRegion(selectedRegion, animated: true)
        }
        centerMapOnLocation(location: centerLocation)

    }
    @objc func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func segmentedControlAction(sender: UISegmentedControl!) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
        }
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
