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
    
    @IBAction func Edit(_ sender: Any) {
    }
    @IBOutlet weak var jokeTitle: UILabel!
    @IBOutlet weak var jokeText: UILabel!
    var jokeDetail : Joke!
    
    @IBOutlet weak var jokeScore: UILabel!
    @IBAction func back(_ sender: Any) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //接收編輯頁面回傳的資訊
        // Do any additional setup after loading the view.
        //接收編輯頁面回傳的資訊
        let notificationName = Notification.Name("GetUpdateNoti")
        NotificationCenter.default.addObserver(self, selector: #selector(getUpdateNoti(noti:)), name: notificationName, object: nil)
        updateInfo()
        
        jokeText.lineBreakMode = NSLineBreakMode.byWordWrapping
        jokeText.numberOfLines = 0
        // Do any additional setup after loading the view.
    }
    
    //在这个方法中给新页面传递参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEdit"{
            let controller = segue.destination as! Edit
//            print(jokeDetail.Content!)
            controller.editJoke = jokeDetail
        }
    }
    
    func updateInfo(){
        //更新畫面上的資訊
        jokeTitle?.text = jokeDetail?.Name
        jokeText?.text = jokeDetail?.Content
        jokeScore?.text=String(jokeDetail.Score!)
    }
    
    @objc func getUpdateNoti(noti:Notification) {
        //接收編輯頁面回傳的資訊
        jokeDetail = noti.userInfo!["PASS"] as! Joke
        updateInfo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
