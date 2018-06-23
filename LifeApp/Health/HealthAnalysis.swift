//
//  HealthAnalysis.swift
//  LifeApp
//
//  Created by Student on 2018/6/6.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class HealthAnalysis: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var list = [String]()
    var record = Record(date: "", condition: "", medicine: [""])
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HealthAnalysisTableViewCell
        cell.textLabel?.text = list[indexPath.row]
        
        do {
            let path = NSHomeDirectory() + "/Documents/" + record.getDate() + ".txt"
            let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
            var count = 0;
            content.enumerateLines({ (line, stop) -> () in
                if(count==indexPath.row)
                {
                    if(line != "nil")
                    {
                        cell.label.text = line
                    }
                }
                count+=1
            })
        } catch {
            print("Error:", error.localizedDescription)
        }
        
        return cell
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
