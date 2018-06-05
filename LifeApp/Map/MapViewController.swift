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

class tableCell: UITableViewCell
{
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Address: UILabel!
}

class MapViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restlist.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! tableCell
        cell.Name?.text = restlist[indexPath.row].title
        cell.Address?.text = restlist[indexPath.row].subtitle
        return cell
    }
    
    var restlist = [restaurantAnnotation]()
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
        restlist.append(restaurantAnnotation(title: "NTNU", subtitle: "school", coordinate: CLLocationCoordinate2DMake(25.006803548528282 , 121.53556901440642)))
        restlist.append(restaurantAnnotation(title: "枋敘", subtitle: "小吃", coordinate: CLLocationCoordinate2DMake(25.004280, 121.536681)))
        restlist.append(restaurantAnnotation(title: "三角冰冰品", subtitle: "冰店", coordinate: CLLocationCoordinate2DMake(25.004701, 121.538025)))
        restlist.append(restaurantAnnotation(title: "自由51", subtitle: "炒飯", coordinate: CLLocationCoordinate2DMake(25.007496, 121.537789)))
        mapView.addAnnotations(restlist)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
