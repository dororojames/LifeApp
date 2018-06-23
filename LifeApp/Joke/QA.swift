//
//  QA.swift
//  LifeApp
//
//  Created by Student on 2018/6/5.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit


class JokeTableViewCell: UITableViewCell {
    @IBOutlet weak var JokeName: UILabel!
}

class QA: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    let ORDER = 0
    let NAME = 0
    let JOKETYPE = 1
    let SCORE = 2
    let Like = 3
    let CONTENT = 4
    
    
    
    @IBOutlet weak var bar: UINavigationBar!
    
    @IBOutlet weak var TableView: UITableView!
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)  
    }
    @IBOutlet weak var TypeBarTitle: UINavigationBar!
    var JokeTypeText:String = ""
    var jokeDetail : Joke!
//    var Jokelist = [Joke]()
    var jokelist = JokeList()
    var ListArray = [[Joke]]()
    var type = 0
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListArray[type].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! JokeTableViewCell
        if ListArray[type].count != 0
        {
            cell.accessoryType = .disclosureIndicator
            cell.JokeName?.text=ListArray[type][indexPath.row].getName()
        }
        return cell
    }
    override func viewWillAppear(_ animated: Bool){
        bar.topItem?.title = JokeTypeText
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bar.topItem?.title = JokeTypeText
//
//        for i in 0...1
//        {
//            let path = NSHomeDirectory() + "/Documents/joke"+String(i)+".txt"
//            do {
//                var jokeTemp : Joke!
//                let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
//                var count = 0;
//                jokeTemp = Joke(Order: 0, Name: "", jokeType: "", Score: 0, Like: 0,Content: "")
//
//                jokeTemp.Order=i
//                content.enumerateLines({ (line, stop) -> () in
//                    print(line)
//                    switch count
//                    {
//                    case self.NAME:
//                        jokeTemp.Name=line
//                    case self.JOKETYPE:
//                        jokeTemp.jokeType=line
//                    case self.SCORE:
//                        jokeTemp.Score=Int(line)
//                    case self.Like:
//                        jokeTemp.Like=Int(line)
//                    case self.CONTENT:
//                        jokeTemp.Content=line
//                    default:
//                        print("Error")
//                    }
//                    count+=1
//                })
//                self.jokelist.ListAppend(joke: jokeTemp)
//
//            } catch {
//                print("Error:", error.localizedDescription)
//            }
//        }
        
        
        
//            if Jokelist.count==0
//            {
//                Jokelist.append(Joke(Order: 0,Name: "距離",jokeType: "黃色笑話",Score: 3,Content: "有天看見了我的死黨鬱悶的坐在咖啡廳，臉色黯淡\n於是我上前安慰他，探問發生了什麼事\n死黨: 我的情書被退回了...還被打了一巴掌\n我: 咦？你寫了什麼，我能看看嗎？\n內容: 如果太陽與地球的距離是149600000\n那我希望我與你的距離是-30公分"))
//                Jokelist.append(Joke(Order: 1,Name: "黨中央",jokeType: "黃色笑話",Score: １,Content: "有天毛主席出席記者會，眾人只見毛主席穿著一件兜擋布，於是好奇的探問\n記者: 毛主席，請問為什麼您只穿一件兜擋布呢？\n毛主席: 一切都是為了擋中央啊"))
//                Jokelist.append(Joke(Order: 2,Name: "用途",jokeType: "黃色笑話",Score: 2,Content: "有個很喜歡開黃腔的男同學發現最近的天氣放晴，是個適合狩獵的季節，於是找了一個女同學打算搭訕她\n\n男同學: 你知道小黃瓜的用途是什麼嗎？\n\n女同學: 不知道\n\n男同學: 那妳知道香蕉的用途是什麼嗎?\n\n女同學: 不知道\n\n男同學: 那妳知道茄子的用途是什麼嗎？\n\n女同學: 不知道\n\n男同學: 那妳知道西瓜的用途是什麼嗎？\n\n女同學: 西...西瓜也可以嗎"))
//            }
    
        
        // Do any additional setup after loading the view.
        //接收編輯頁面回傳的資訊
        // Do any additional setup after loading the view.
        //接收編輯頁面回傳的資訊
//        let notificationName = Notification.Name("GetUpdateNoti")
//        NotificationCenter.default.addObserver(self, selector: #selector(getUpdateNoti(noti:)), name: notificationName, object: nil)
        
        
    
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        TableView.reloadData()
    }
    
    
    
    //在这个方法中给新页面传递参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "QAShowJokeText"{
            let controller = segue.destination as! JokeTest
            controller.jokelist = jokelist
            controller.ListArray = ListArray
            controller.type = type
        controller.index=(TableView.indexPathForSelectedRow?.row)!
            controller.comefrom = segue.identifier
        }
    }
//    func getUpdateNoti(noti:Notification) {
//        //接收編輯頁面回傳的資訊
//        jokeDetail = noti.userInfo!["PASS"] as! Joke
//        ListArray[type][jokeDetail.Order!] = jokeDetail
//        print(ListArray[type][jokeDetail.Order!].Score)
//    }
//    @objc func getUpdateNoti(noti:Notification) {
//        //接收編輯頁面回傳的資訊
//        ListArray[type][] = noti.userInfo!["PASS"] as! Joke
//
//    }
    
    //尾部滑动事件按钮（左滑按钮）
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
        indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //创建“删除”事件按钮
        let delete = UIContextualAction(style: .destructive, title: "删除") {
            (action, view, completionHandler) in
            //将对应条目的数据删除
            if self.ListArray[self.type].count>indexPath.row
            {
                self.ListArray[self.type].remove(at: indexPath.row)
            }
            completionHandler(true)
        }
        
        //返回所有的事件按钮
        let configuration = UISwipeActionsConfiguration(actions: [delete])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
