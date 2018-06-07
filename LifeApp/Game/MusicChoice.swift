//
//  MusicChoice.swift
//  LifeApp
//
//  Created by Student on 2018/6/7.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit


class Music: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var list=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        list.append("雲流れ Foxtail-Grass Studio")
        list.append("test")
        list.append("XXX")
        list.append("list.4")
        
    }
    func numberOfSections(in tableView: UITableView)->Int{
    return 1    //1表示表格上只有１個區段
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count //每區段有多少筆資料
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier:"SongCell",for:indexPath)
        cell.textLabel?.text=list[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(list[indexPath.row])
        }
    }
   
    

