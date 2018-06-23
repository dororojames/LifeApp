//
//  JokeType.swift
//  LifeApp
//
//  Created by Student on 2018/6/3.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class JokeType: UIViewController{
    var jokelist = JokeList()
    var ListArray = [[Joke]].init(repeating: [], count: 5)
    @IBAction func back(_ sender: Any) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)  
    }
    @IBAction func 問答笑話(_ sender: Any) {
    }
    @IBAction func 黃色笑話(_ sender: Any) {
    }
    @IBAction func 雙關笑話(_ sender: Any) {
    }
    @IBAction func 內涵笑話(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! QA
        if segue.identifier == "ShowTypeList1"{
            controller.JokeTypeText="問答笑話"
            controller.type=jokelist.Qa
        }
        else if segue.identifier == "ShowTypeList2"{
            controller.JokeTypeText="黃色笑話"
            controller.type=jokelist.Adult
        }
        else if segue.identifier == "ShowTypeList3"{
            controller.JokeTypeText="雙關笑話"
            controller.type=jokelist.Pun
        }
        else if segue.identifier == "ShowTypeList4"{
            controller.JokeTypeText="內涵笑話"
            controller.type=jokelist.Metaphor
        }
        controller.jokelist=jokelist
        controller.ListArray=ListArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ListArray[jokelist.Adult]=jokelist.AdultList
        ListArray[jokelist.Qa]=jokelist.QaList
        ListArray[jokelist.Pun]=jokelist.PunList
        ListArray[jokelist.Metaphor]=jokelist.MetaphorList
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
