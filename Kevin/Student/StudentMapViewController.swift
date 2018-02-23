//
//  StudentMapViewController.swift
//  Kevin
//
//  Created by Victoria Knight on 2/18/18.
//  Copyright © 2018 Tantivirun. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class StudentMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
    {
    @IBOutlet weak var mapView2: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(BackButton))
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let centerLocation = CLLocation(latitude: 43.1948, longitude: -71.5734)
        
        let regionSpan: CLLocationDistance = 500
        func centerMapOnLocation(location: CLLocation) {
            let selectedRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionSpan, regionSpan)
            mapView2.setRegion(selectedRegion, animated: true)
        }
        centerMapOnLocation(location: centerLocation)
    }
 
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated:true, completion:nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func mapTypeSelection(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView2.mapType = .standard
        case 1:
            mapView2.mapType = .satellite
        default:
            mapView2.mapType = .hybrid
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
