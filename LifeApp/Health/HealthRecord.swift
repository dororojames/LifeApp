//
//  HealthRecord.swift
//  LifeApp
//
//  Created by Student on 2018/6/6.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class HealthRecord: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var list = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list.append("2018_6_6")
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCellEditingStyle,forRowAt indexPath: IndexPath){
        list.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }

    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath:IndexPath)->String?
    {
        return "刪除"
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
