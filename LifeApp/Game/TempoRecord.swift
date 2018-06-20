//
//  TempoRecord.swift
//  LifeApp
//
//  Created by Student on 2018/6/11.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class TempoRecord: UIViewController {
    
    @IBOutlet weak var Beshit: UILabel!
    @IBOutlet weak var ThisHit: UILabel!
    @IBOutlet weak var ThisMiss: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    getRecord()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRecord(){
        let UserDefault = UserDefaults.standard
        let hit = UserDefault.integer(forKey: "HitNum")
        let BestHit=UserDefault.integer(forKey: "BestHitNum")
        let Miss=UserDefault.integer(forKey: "MissNum")
        Beshit.text=String(BestHit)
        ThisHit.text=String(hit)
        ThisMiss.text=String(Miss)
    }

    @IBAction func ClearClick(_ sender: Any) {
        clearUserdefault()
    }
    
    func clearUserdefault(){
     let UserDefault = UserDefaults.standard
     UserDefault.set(0,forKey: "HitNum")
     UserDefault.set(0,forKey: "BestHitNum")
     UserDefault.set(0,forKey: "MissNum")
        getRecord()
    }
}

