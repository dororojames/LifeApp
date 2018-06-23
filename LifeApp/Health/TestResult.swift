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
    
    var list = [String]()
    var score : Int = 0
    var medicine = ["蓮子"]
    var condition : String = ""
    var date : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy_M_d H_m_s"
        date = formatter.string(from: Date())
        condition = diagnose()

        list.append("診斷結果")
        list.append("建議藥材")
    
        do {
            let path = NSHomeDirectory() + "/Documents/" + date + ".txt"
            var outString = ""
            outString += condition + "\n"
            for i in 0 ... medicine.count-1
            {
                outString += medicine[i] + " "
            }
            try outString.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
        } catch {
            print("Error:", error.localizedDescription)
        }
        
        do {
            let path = NSHomeDirectory() + "/Documents/Record.txt"
            let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
            var outString = content as String
            outString += date + "\n"
            try outString.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
        } catch {
            print("Error:", error.localizedDescription)
        }
        
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
            cell.content.text = condition
        case 1:
            var outString : String = ""
            outString += "\n"
            for i in 0 ... medicine.count-1
            {
                outString += medicine[i] + " "
            }
            cell.content.text = outString
        default:
            print("error")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section :Int) ->String?{
        return "健康資料"
    }
    
    func diagnose() -> String! {
        if(score>=60)
        {
            return "健康良好"
        }
        else
        {
            return "健康不良"
        }
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
