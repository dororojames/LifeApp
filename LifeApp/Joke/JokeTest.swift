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
    
    @IBOutlet weak var addToMyFavorite: UIButton!
    @IBAction func Edit(_ sender: Any) {
    }
    @IBOutlet weak var jokeTitle: UILabel!
    @IBOutlet weak var jokeText: UILabel!
//    var jokeDetail : Joke!
    var jokelist = JokeList()
    var ListArray = [[Joke]]()
    var index = 0
    var type = 0
    var comefrom: String!
    @IBOutlet weak var jokeScore: UILabel!
    @IBAction func back(_ sender: Any) {
        
//        let notificationName = Notification.Name("GetUpdateNoti")
//
//        //取畫面上的值
//        ListArray[type][index].Name = jokeTitle.text
//        ListArray[type][index].Content = jokeText.text
//
//        //發送通知
//        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["PASS":ListArray[type][index]])
        
        //回到前一頁
        self.navigationController?.popViewController(animated: true)
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToMyFavorite(_ sender: Any) {
        if (comefrom=="QAShowJokeText")
        {
            if(ListArray[type][index].Like==0)
            {
                jokelist.FavoriteListAppend(joke: ListArray[type][index])
                //        ListArray[4] = jokelist.FavoriteList
                addToMyFavorite.backgroundColor = UIColor.red
                ListArray[type][index].Like=1
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (comefrom=="QAShowJokeText")
        {
            if(ListArray[type][index].Like==1)
            {
                addToMyFavorite.backgroundColor = UIColor.red
            }
            else
            {
                addToMyFavorite.backgroundColor = UIColor.white
            }
        }
        else if(comefrom=="MyFavoriteShowJokeText")
        {
            addToMyFavorite.backgroundColor = UIColor.red
        }
        
        
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
//            controller.ListArray = ListArray
//            controller.type = type
//            controller.index = index
            if (comefrom=="QAShowJokeText")
            {
                controller.editJoke = ListArray[type][index]
            }
            else if (comefrom=="MyFavoriteShowJokeText")
            {
                controller.editJoke = jokelist.FavoriteList[index]
            }
        }
    }
    
    func updateInfo(){
        //更新畫面上的資訊
        if (comefrom=="QAShowJokeText")
        {
            jokeTitle?.text = ListArray[type][index].getName()
            jokeText?.text = ListArray[type][index].getContent()
            print(String(ListArray[type][index].Score!))
            jokeScore?.text=String(ListArray[type][index].Score!)
        }
        else if(comefrom=="MyFavoriteShowJokeText")
        {
            jokeTitle?.text = jokelist.FavoriteList[index].getName()
            jokeText?.text = jokelist.FavoriteList[index].getContent()
        jokeScore?.text=String(jokelist.FavoriteList[index].Score!)
        }
    }
    
    @objc func getUpdateNoti(noti:Notification) {
        //接收編輯頁面回傳的資訊
        if (comefrom=="QAShowJokeText")
        {
        ListArray[type][index] = noti.userInfo!["PASS"] as! Joke
        }
        else if(comefrom=="MyFavoriteShowJokeText")
        {
            jokelist.FavoriteList[index] = noti.userInfo!["PASS"] as! Joke
        }
        updateInfo()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
