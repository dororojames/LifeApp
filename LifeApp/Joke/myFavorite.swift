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
//    var FovoriteList=[Joke]()
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
        let delete = UIContextualAction(style: .destructive, title: "删除") {
            (action, view, completionHandler) in
            self.jokelist.FavoriteList[indexPath.row].Like=0
            //将对应条目的数据删除
            
            if self.jokelist.FavoriteList.count>indexPath.row
            {
                self.jokelist.FavoriteList.remove(at: indexPath.row)
            }
            print(indexPath.row,123456)
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
        
//        for i in 0...1
//        {
//            let path = NSHomeDirectory() + "/Documents/joke"+String(i)+".txt"
//            if()
//        }
//
//
//        for i in 0...1
//        {
//            let path = NSHomeDirectory() + "/Documents/joke"+String(i)+".txt"
//            do {
//                var jokeTemp : Joke!
//                let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
//                var count = 0;
//                jokeTemp = Joke(Order: 0, Name: "", jokeType: "", Score: 0, Content: "")
//                jokeTemp.Order=i
//                content.enumerateLines({ (line, stop) -> () in
//                    print(line)
//                    switch count
//                    {
//                    case self.NAME:
//                        jokeTemp.Name=line
//                    //                        print(jokeTemp.Name)
//                    case self.JOKETYPE:
//                        jokeTemp.jokeType=line
//                    //                        print(jokeTemp.jokeType)
//                    case self.SCORE:
//                        jokeTemp.Score=Int(line)
//                        print(type(of: jokeTemp.Score),jokeTemp.Score)
//                    case self.CONTENT:
//                        jokeTemp.Content=line
//                    //                        print(jokeTemp.Content)
//                    default:
//                        print("Error")
//                    }
//                    count+=1
//                })
//                self.Jokelist.append(jokeTemp)
//
//            } catch {
//                print("Error:", error.localizedDescription)
//            }
//        }
        
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       tableView.reloadData()
    }
    
//    // UITableViewDelegate 方法，处理列表项的选中事件
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        
//        
//        self.tableView!.deselectRow(at: indexPath, animated: true)
//        let JokeTitleString = [self.jokelist.FavoriteList[indexPath.row].getName(),self.jokelist.FavoriteList[indexPath.row].Content]
//        self.performSegue(withIdentifier: "ShowEdit", sender: JokeTitleString)
//    }
    
    //在这个方法中给新页面传递参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MyFavoriteShowJokeText"{
            let controller = segue.destination as! JokeTest
            controller.jokelist = jokelist
//            controller.type = 4
//            controller.ListArray[4] = jokelist.FavoriteList
            controller.comefrom = segue.identifier
            controller.index=(tableView.indexPathForSelectedRow?.row)!
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
