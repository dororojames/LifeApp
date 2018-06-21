//
//  JokeViewController.swift
//  LifeApp
//
//  Created by Student on 2018/5/28.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController {

    @IBAction func unwindSegueBack_JokeType(for segue: UIStoryboardSegue) {
    }
    @IBAction func unwindSegueBack_Favorite(for segue: UIStoryboardSegue) {
    }
  
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }}
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }}
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }}}

