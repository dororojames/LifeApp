//
//  myFavorite.swift
//  LifeApp
//
//  Created by Student on 2018/6/4.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class myFavorite: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var jokelist = JokeList()
    @IBOutlet weak var tableView: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokelist.FavoriteList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let JokeName = cell.contentView.viewWithTag(1) as! UILabel
        JokeName.text=jokelist.FavoriteList[indexPath.row].getName()
        return cell
    }

    //尾部滑动事件按钮（左滑按钮）
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
        indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //创建“删除”事件按钮
        let delete = UIContextualAction(style: .destructive, title: "删除"){
            (action, view, completionHandler) in
            print(indexPath.row,123)
            self.jokelist.FavoriteList[indexPath.row].setLike(like: 0)
            //将对应条目的数据删除
            if(self.jokelist.FavoriteList.count>indexPath.row)
            {
                self.jokelist.FavoriteList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            completionHandler(true)
        }
        //返回所有的事件按钮
        let configuration = UISwipeActionsConfiguration(actions: [delete])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //在这个方法中给新页面传递参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MyFavoriteShowJokeText"{
            let controller = segue.destination as! JokeTest
            controller.jokelist = jokelist
            controller.comefrom = segue.identifier
            controller.index=(tableView.indexPathForSelectedRow?.row)!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
