//
//  MusicChoice.swift
//  LifeApp
//
//  Created by Student on 2018/6/7.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit


class SongCell:UITableViewCell{

    @IBOutlet weak var NameLab: UILabel!
}

class Music: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var list=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        list.append("000")
        list.append("001")
        list.append("002")
    }
    
    func numberOfSections(in tableView: UITableView)->Int{
        return 1    //1表示表格上只有１個區段
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count //每區段有多少筆資料
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier:"Cell",for:indexPath) as!SongCell
        cell.NameLab?.text=list[indexPath.row]
        return cell
    }
    
    // UITableViewDelegate方法，處理列表項的選中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        let itemString = list[indexPath.row]
        self.performSegue(withIdentifier: "MusicGameView", sender: itemString)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MusicGameView"{
            let controller = segue.destination as! MusicGameController
            controller.itemString = sender as? String
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
   
    

