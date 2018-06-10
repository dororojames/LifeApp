//
//  Edit.swift
//  LifeApp
//
//  Created by Student on 2018/6/7.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class Edit: UIViewController {
    var JokeTitleString:[String]=[]
    @IBOutlet weak var jokeTitle: UILabel!
    @IBOutlet weak var jokeContent: UITextView!
    
    var editJoke : Joke!
    @IBAction func cancel(_ sender: Any) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    @IBAction func score1(_ sender: Any) {
        editJoke.Score = 1
    }
    @IBAction func score2(_ sender: Any) {
        editJoke.Score = 2
    }
    @IBAction func score3(_ sender: Any) {
        editJoke.Score = 3
    }
    @IBAction func finished(_ sender: Any) {
        let notificationName = Notification.Name("GetUpdateNoti")
        
        //取畫面上的值
        editJoke.Name = jokeTitle.text
        editJoke.Content = jokeContent.text
        
        //發送通知
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["PASS":editJoke])
        
        //回到前一頁
        print(1)
        self.navigationController?.popViewController(animated: true)
        print(2)
        self.presentingViewController!.dismiss(animated: true, completion: nil) 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeTitle?.text = editJoke?.Name
        jokeContent?.text = editJoke?.Content
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


