//
//  History.swift
//  LifeApp
//
//  Created by Student on 2018/6/5.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class History: UIViewController {
    
    @IBAction func back(_ sender: Any) {
    }
    var list = [Joke]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //尾部滑动事件按钮（左滑按钮）
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt
        indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //创建“删除”事件按钮
        let delete = UIContextualAction(style: .destructive, title: "删除") {
            (action, view, completionHandler) in
            //将对应条目的数据删除
            if self.list.count>indexPath.row
            {
                self.list.remove(at: indexPath.row)
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
