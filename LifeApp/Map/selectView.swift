//
//  selectView.swift
//  LifeApp
//
//  Created by Dororo on 2018/6/1.
//  Copyright © 2018年 Student. All rights reserved.
//

import Foundation
import UIKit

class selectView: UIViewController, UITextFieldDelegate {
    
    
    @IBAction func Back(_ sender: Any) {
    }
    @IBOutlet weak var price_low: UITextField!
    @IBOutlet weak var price_high: UITextField!
    @IBOutlet weak var distance_low: UITextField!
    @IBOutlet weak var distance_high: UITextField!
    @IBAction func search(_ sender: Any) {
        print(price_low.text!,price_high.text!,distance_low.text!,distance_high.text!)
    }
    
    var restaurantlist: RestaurantList!
    var comefrom: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        price_low.delegate = self
        price_high.delegate = self
        distance_low.delegate = self
        distance_high.delegate = self
        restaurantlist.listRestaurants()
        print(comefrom)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == price_low {
            price_high.becomeFirstResponder()
        }
        else if textField == price_high {
            distance_low.becomeFirstResponder()
        }
        else if textField == distance_low {
            distance_high.becomeFirstResponder()
        }
        else{
            price_low.resignFirstResponder()
        }
        return true
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
