//
//  myFavorite.swift
//  LifeApp
//
//  Created by Student on 2018/6/4.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit



class myFavorite: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var FovoriteList=[Joke(Order: 0,Name: "距離",jokeType: "黃色笑話",Score: 3,Content: "有天看見了我的死黨鬱悶的坐在咖啡廳，臉色黯淡\n於是我上前安慰他，探問發生了什麼事\n死黨: 我的情書被退回了...還被打了一巴掌\n我: 咦？你寫了什麼，我能看看嗎？\n內容: 如果太陽與地球的距離是149600000\n那我希望我與你的距離是-30公分"),Joke(Order: 1,Name: "黨中央",jokeType: "黃色笑話",Score: 1,Content: "有天毛主席出席記者會，眾人只見毛主席穿著一件兜擋布，於是好奇的探問\n記者: 毛主席，請問為什麼您只穿一件兜擋布呢？\n毛主席: 一切都是為了擋中央啊"),Joke(Order: 2,Name: "用途",jokeType: "黃色笑話",Score: 2,Content: "有個很喜歡開黃腔的男同學發現最近的天氣放晴，是個適合狩獵的季節，於是找了一個女同學打算搭訕她\n\n男同學: 你知道小黃瓜的用途是什麼嗎？\n\n女同學: 不知道\n\n男同學: 那妳知道香蕉的用途是什麼嗎?\n\n女同學: 不知道\n\n男同學: 那妳知道茄子的用途是什麼嗎？\n\n女同學: 不知道\n\n男同學: 那妳知道西瓜的用途是什麼嗎？\n\n女同學: 西...西瓜也可以嗎")]
    @IBOutlet weak var tableView: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FovoriteList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let JokeName = cell.contentView.viewWithTag(1) as! UILabel
        JokeName.text=FovoriteList[indexPath.row].Name
        return cell
    }
    
    
    
    
    
    //尾部滑动事件按钮（左滑按钮）
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
        indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //创建“删除”事件按钮
        let delete = UIContextualAction(style: .destructive, title: "删除") {
            (action, view, completionHandler) in
            //将对应条目的数据删除
            if self.FovoriteList.count>indexPath.row
            {
                self.FovoriteList.remove(at: indexPath.row)
            }
            completionHandler(true)
        }
        
        //返回所有的事件按钮
        let configuration = UISwipeActionsConfiguration(actions: [delete])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    @IBAction func back(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UITableViewDelegate 方法，处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        let JokeTitleString = [self.FovoriteList[indexPath.row].Name,self.FovoriteList[indexPath.row].Content]
        self.performSegue(withIdentifier: "ShowEdit", sender: JokeTitleString)
    }
    
    //在这个方法中给新页面传递参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEdit"{
            let controller = segue.destination as! Edit
            controller.JokeTitleString = sender as! [String]
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
