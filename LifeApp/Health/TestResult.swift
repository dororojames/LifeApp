//
//  TestResult.swift
//  LifeApp
//
//  Created by Student on 2018/6/9.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class TestResult: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var tableView:UITableView?
    
    var recordlist = RecordList()
    var record = Record(date: "", condition: "", medicine: [""])
 
    var list = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        record.saveRecord()
        recordlist.insertRecord(record: record)
        recordlist.saveRecordList()

        list.append("診斷結果")
        list.append("建議藥材")
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TestResultTableCell
        cell.textLabel?.text = list[indexPath.row]
        switch indexPath.row {
        case 0:
            cell.content.text = record.getCondition()
        case 1:
            var outString : String = ""
            outString += "\n"
            if(record.getMedicine().count>0)
            {
                for i in 0 ... record.getMedicine().count-1
                {
                    outString += record.getMedicine(id: i) + " "
                }
                cell.content.text = outString
            }
        default:
            print("error")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section :Int) ->String?{
        return "健康資料"
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
