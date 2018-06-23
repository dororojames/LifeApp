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
    var JokeTypeText:String = ""
    var jokeDetail : Joke!
    var jokelist = JokeList()
    var ListArray = [[Joke]]()
    var type = 0
    @IBOutlet weak var bar: UINavigationBar!
    @IBOutlet weak var TableView: UITableView!
    @IBAction func back(_ sender: Any) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)  
    }
    @IBOutlet weak var TypeBarTitle: UINavigationBar!
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
