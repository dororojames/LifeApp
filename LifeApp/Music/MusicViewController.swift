//
//  ViewController.swift
//  music
//
//  Created by Student on 2018/6/5.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {

    @IBOutlet weak var addMusic: UIButton!
    @IBOutlet weak var musicData: UITableView!
    
    @IBAction func unwindToPlayer(for segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

