//
//  JokeTest.swift
//  LifeApp
//
//  Created by Student on 2018/6/5.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class JokeTest: UIViewController {

var JokeTitleString:[String]=[]
    
    @IBOutlet weak var jokeTitle: UILabel!
    @IBOutlet weak var jokeText: UILabel!
    
    @IBOutlet weak var 喜好程度: UILabel!
    @IBAction func 加入我的最愛(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeTitle.text=JokeTitleString[0]
        jokeText.text=JokeTitleString[1]
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
