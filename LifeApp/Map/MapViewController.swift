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

class MapViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    
    
    
    var list = [String]()
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func roll(for segue: UIStoryboardSegue) {
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
        list.append("枋敘")
        list.append("老袁")
        list.append("薩莉雅")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
