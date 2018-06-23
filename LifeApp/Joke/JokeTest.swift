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
    var jokelist = JokeList()
    var ListArray = [[Joke]]()
    var index = 0
    var type = 0
    var comefrom: String!
    @IBOutlet weak var addToMyFavorite: UIButton!
    @IBAction func Edit(_ sender: Any) {
    }
    @IBOutlet weak var jokeTitle: UILabel!
    @IBOutlet weak var jokeText: UILabel!
    @IBOutlet weak var jokeScore: UILabel!
    @IBAction func back(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    @IBAction func addToMyFavorite(_ sender: Any) {
        if (comefrom=="QAShowJokeText")
        {
            if(ListArray[type][index].getLike()==0)
            {
                jokelist.FavoriteListAppend(joke: ListArray[type][index])
                addToMyFavorite.backgroundColor = UIColor.red
                ListArray[type][index].setLike(like: 1)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (comefrom=="QAShowJokeText")
        {
            if(ListArray[type][index].getLike()==1)
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
            if (comefrom=="QAShowJokeText")
            {
                controller.editJoke = ListArray[type][index]
            }
            else if (comefrom=="MyFavoriteShowJokeText")
            {
                controller.editJoke = jokelist.FavoriteList[index]
            }
            controller.jokelist = jokelist
            controller.type = type
        }
    }
    
    func updateInfo(){
        //更新畫面上的資訊
        if (comefrom=="QAShowJokeText")
        {
            jokeTitle?.text = ListArray[type][index].getName()
            jokeText?.text = ListArray[type][index].getContent()
            jokeScore?.text=String(ListArray[type][index].getScore())
        }
        else if(comefrom=="MyFavoriteShowJokeText")
        {
            jokeTitle?.text = jokelist.FavoriteList[index].getName()
            jokeText?.text = jokelist.FavoriteList[index].getContent()
            jokeScore?.text=String(jokelist.FavoriteList[index].getScore())
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


