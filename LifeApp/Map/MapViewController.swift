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
import CoreData

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
        return restaurantlist.restaurants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! tableCell
        cell.Name?.text = restaurantlist.restaurants[indexPath.row].name
        cell.Address?.text = restaurantlist.restaurants[indexPath.row].address
        return cell
    }
    
    var restaurantlist = RestaurantList()
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func roll(for segue: UIStoryboardSegue) {
    }
    
    @IBAction func unwindToselect(for segue: UIStoryboardSegue) {
    }
    
    @IBOutlet weak var tableView: UITableView!
    var app = UIApplication.shared.delegate as! AppDelegate
    var viewContext: NSManagedObjectContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dis:CLLocationDegrees = 3000
        let ntnuLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(25.006803548528282 , 121.53556901440642)
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(ntnuLocation, dis, dis), animated: true)
        let TABLE = table(app: app)
        TABLE.getlist(restlist: &restaurantlist.restaurants)
        restaurantlist.listRestaurants()
        mapView.addAnnotations(restaurantlist.annotationlist)
        print("OK!")
    }
    
    //在这个方法中给新页面传递参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurant"{
            let controller = segue.destination as! RestaurantViewController
            controller.restaurant = restaurantlist.restaurants[(tableView.indexPathForSelectedRow?.row)!]
            controller.annotation = restaurantlist.annotationlist[(tableView.indexPathForSelectedRow?.row)!]
        }
        else if segue.identifier == "restaurantFilter" || segue.identifier == "randomSelect" {
            let controller = segue.destination as! selectView
            controller.restaurantlist = restaurantlist
            controller.comefrom = segue.identifier
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
