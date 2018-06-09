//
//  RestaurantViewController.swift
//  LifeApp
//
//  Created by Dororo on 2018/6/9.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit
import MapKit

class RestaurantViewController: UIViewController {
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Tag: UILabel!
    @IBOutlet weak var isOpen: UILabel!
    @IBOutlet weak var Address: UILabel!
    
    @IBAction func Back(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    var restaurant:Restaurants!
    var annotation: restaurantAnnotation!
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if restaurant != nil
        {
            print(restaurant.name!)
        }
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(annotation.coordinate, 3000, 3000), animated: true)
        mapView.addAnnotation(annotation)
        Name.text = restaurant.name
        Tag.text = restaurant.firstTag
        Address.text = restaurant.address
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
