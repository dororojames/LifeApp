//
//  GuessRecord.swift
//  LifeApp
//
//  Created by Student on 2018/6/10.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class RecordBoardView: UIViewController {
    
    @IBOutlet weak var bestTime: UILabel!
    @IBOutlet weak var bestCounter: UILabel!
    @IBOutlet weak var thisTime: UILabel!
    @IBOutlet weak var thisCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRecord()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRecord(){
        let userDefault = UserDefaults.standard
        let gameCounter = userDefault.integer(forKey: "Counter")
        let BestCounter = userDefault.integer(forKey: "BestCounter")
        let BestTime = userDefault.integer(forKey: "BestTime")
        let TotalTime = userDefault.integer(forKey: "Totaltime")
        bestCounter.text=String(BestCounter)
        bestTime.text=String(BestTime/60) + ":" + String(format: "%02d", BestTime%60)
        thisTime.text=String(TotalTime/60) + ":" + String(format: "%02d", TotalTime%60)
        thisCounter.text=String(gameCounter)
    }
    
    @IBAction func clear(_ sender: Any) {
        clearUserdefault()
    }
    
    func clearUserdefault(){
        let userDefaults = UserDefaults.standard
        userDefaults.set(0,forKey:"Totaltime")
        userDefaults.set(0,forKey:"Counter")
        userDefaults.set(0,forKey:"BestTime")
        userDefaults.set(0,forKey:"BestCounter")
        getRecord()
    }
}

