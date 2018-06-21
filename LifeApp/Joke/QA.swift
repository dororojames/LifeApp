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
    let CONTENT = 3
    
    
    
    @IBOutlet weak var bar: UINavigationBar!
    
    @IBOutlet weak var TableView: UITableView!
    
    @IBAction func back(_ sender: Any) {
    }
    @IBOutlet weak var TypeBarTitle: UINavigationBar!
    var JokeTypeText:String = ""
    var jokeDetail : Joke!
    var Jokelist = [Joke]()
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Jokelist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! JokeTableViewCell
        if Jokelist.count != 0
        {
            cell.accessoryType = .disclosureIndicator
            cell.JokeName?.text=Jokelist[indexPath.row].Name
        }
        return cell
    }
    override func viewWillAppear(_ animated: Bool){
        bar.topItem?.title = JokeTypeText
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bar.topItem?.title = JokeTypeText

        
        for i in 0...1
        {
            let path = NSHomeDirectory() + "/Documents/joke"+String(i)+".txt"
            do {
                var jokeTemp : Joke!
                let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
                var count = 0;
                jokeTemp = Joke(Order: 0, Name: "", jokeType: "", Score: 0, Content: "")
                jokeTemp.Order=i
                content.enumerateLines({ (line, stop) -> () in
                    print(line)
                    switch count
                    {
                    case self.NAME:
                        jokeTemp.Name=line
//                        print(jokeTemp.Name)
                    case self.JOKETYPE:
                        jokeTemp.jokeType=line
//                        print(jokeTemp.jokeType)
                    case self.SCORE:
                        jokeTemp.Score=Int(line)
                        print(type(of: jokeTemp.Score),jokeTemp.Score)
                    case self.CONTENT:
                        jokeTemp.Content=line
//                        print(jokeTemp.Content)
                    default:
                        print("Error")
                    }
                    count+=1
                })
                self.Jokelist.append(jokeTemp)
                
            } catch {
                print("Error:", error.localizedDescription)
            }
        }
        print(Jokelist[0].Order)
        print(Jokelist[1].Order)
        print(Jokelist[0].Score)
        print(Jokelist[1].Score)
        
        
        
//            if Jokelist.count==0
//            {
//                Jokelist.append(Joke(Order: 0,Name: "距離",jokeType: "黃色笑話",Score: 3,Content: "有天看見了我的死黨鬱悶的坐在咖啡廳，臉色黯淡\n於是我上前安慰他，探問發生了什麼事\n死黨: 我的情書被退回了...還被打了一巴掌\n我: 咦？你寫了什麼，我能看看嗎？\n內容: 如果太陽與地球的距離是149600000\n那我希望我與你的距離是-30公分"))
//                Jokelist.append(Joke(Order: 1,Name: "黨中央",jokeType: "黃色笑話",Score: １,Content: "有天毛主席出席記者會，眾人只見毛主席穿著一件兜擋布，於是好奇的探問\n記者: 毛主席，請問為什麼您只穿一件兜擋布呢？\n毛主席: 一切都是為了擋中央啊"))
//                Jokelist.append(Joke(Order: 2,Name: "用途",jokeType: "黃色笑話",Score: 2,Content: "有個很喜歡開黃腔的男同學發現最近的天氣放晴，是個適合狩獵的季節，於是找了一個女同學打算搭訕她\n\n男同學: 你知道小黃瓜的用途是什麼嗎？\n\n女同學: 不知道\n\n男同學: 那妳知道香蕉的用途是什麼嗎?\n\n女同學: 不知道\n\n男同學: 那妳知道茄子的用途是什麼嗎？\n\n女同學: 不知道\n\n男同學: 那妳知道西瓜的用途是什麼嗎？\n\n女同學: 西...西瓜也可以嗎"))
//            }
    
    
    }
    
    //在这个方法中给新页面传递参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowJokeText"{
            let controller = segue.destination as! JokeTest
            controller.jokeDetail = Jokelist[(TableView.indexPathForSelectedRow?.row)!]
        }
    }
    func getUpdateNoti(noti:Notification) {
        //接收編輯頁面回傳的資訊
        jokeDetail = noti.userInfo!["PASS"] as! Joke
        Jokelist[jokeDetail.Order!] = jokeDetail
    }
    
    //尾部滑动事件按钮（左滑按钮）
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
        indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //创建“删除”事件按钮
        let delete = UIContextualAction(style: .destructive, title: "删除") {
            (action, view, completionHandler) in
            //将对应条目的数据删除
            if self.Jokelist.count>indexPath.row
            {
                self.Jokelist.remove(at: indexPath.row)
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
