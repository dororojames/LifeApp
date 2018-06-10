//
//  JokeType.swift
//  LifeApp
//
//  Created by Student on 2018/6/3.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class JokeType: UIViewController{

    @IBAction func back(_ sender: Any) {
    }
    @IBAction func unwindSegueBack_QA(for segue: UIStoryboardSegue) {
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
        
        if segue.identifier == "ShowTypeList1"{
            let controller = segue.destination as! QA
            controller.JokeTypeText="問答笑話"
        }
        else if segue.identifier == "ShowTypeList2"{
            let controller = segue.destination as! QA
            controller.JokeTypeText="黃色笑話"
        }
        else if segue.identifier == "ShowTypeList3"{
            let controller = segue.destination as! QA
            controller.JokeTypeText="雙關笑話"
        }
        else if segue.identifier == "ShowTypeList4"{
            let controller = segue.destination as! QA
            controller.JokeTypeText="內涵笑話"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
