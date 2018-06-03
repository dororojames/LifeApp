//
//  MapViewController.swift
//  LifeApp
//
//  Created by Dororo on 2018/6/1.
//  Copyright © 2018年 Student. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func click(_ sender: Any) {
    }
    @IBAction func main(_ sender: Any) {
    }
    @IBAction func unwindToselect(for segue: UIStoryboardSegue) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dis:CLLocationDegrees = 3000
        let ntnuLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(25.006803548528282 , 121.53556901440642)
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(ntnuLocation, dis, dis), animated: true)
        let ntnuPin = restaurantAnnotation(title: "NTNU", subtitle: "school", coordinate: ntnuLocation)
        mapView.addAnnotation(ntnuPin)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
