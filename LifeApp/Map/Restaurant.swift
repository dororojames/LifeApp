//
//  Restaurant.swift
//  database
//
//  Created by Dororo on 2018/6/8.
//  Copyright © 2018年 LLF. All rights reserved.
//

import Foundation
import MapKit
class RestaurantList {
    var restaurants = [Restaurants]()
    var annotationlist = [restaurantAnnotation]()
    func listRestaurants() -> Void {
        annotationlist.removeAll()
        for r in restaurants{
            print(r.r_ID!,r.name!)
            for tag in r.tag as! Set<Tags>{
                print(tag.tag!)
                if r.firstTag == nil{
                    r.firstTag = tag.tag!
                }
            }
            for Con in r.contact as! Set<Contacts>{
                print(Con.contact!)
            }
            for Opt in r.opentime as! Set<Opentime>{
                print(Opt.day!)
                print(Opt.timeslot!)
            }
            annotationlist.append(restaurantAnnotation(title: r.name!, subtitle: r.firstTag!, coordinate: CLLocationCoordinate2DMake(Double(r.latitude!)!, Double(r.longitude!)!)))
        }
    }
}
