//
//  myFavorite.swift
//  LifeApp
//
//  Created by Student on 2018/6/4.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit


class JokeTableViewCell: UITableViewCell {
    @IBOutlet weak var JokeName: UILabel!
    @IBOutlet weak var StarNum: UILabel!
}

class myFavorite: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var list = [Joke]()
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! JokeTableViewCell
        cell.JokeName?.text=list[indexPath.row].Name
        cell.StarNum?.text=String(list[indexPath.row].Score!)
        return cell
    }
    

    
    //尾部滑动事件按钮（左滑按钮）
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
        indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //创建“旗标”事件按钮
        let edit = UIContextualAction(style: .normal, title: "編輯") {
            (action, view, completionHandler) in
         
            completionHandler(true)
        }
        edit.backgroundColor = .orange
        
        //创建“删除”事件按钮
        let delete = UIContextualAction(style: .destructive, title: "删除") {
            (action, view, completionHandler) in
            //将对应条目的数据删除
            self.list.remove(at: indexPath.row)
            completionHandler(true)
        }
        
        //返回所有的事件按钮
        let configuration = UISwipeActionsConfiguration(actions: [delete,edit])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    @IBAction func back(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.ㄦ
        list.append(Joke(Name: "笑話1",jokeType: "黃色笑話",Score: 3))
        list.append(Joke(Name: "笑話2",jokeType: "問答笑話",Score: 1))
        list.append(Joke(Name: "笑話3",jokeType: "內涵笑話",Score: 2))
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
