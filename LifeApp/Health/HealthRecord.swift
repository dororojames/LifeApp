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
        
        do {
            let path = NSHomeDirectory() + "/Documents/Record.txt"
            let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
            content.enumerateLines({ (line, stop) -> () in
                    self.list.append(line)
            })
        } catch {
            print("Error:", error.localizedDescription)
        }
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecordToAnalysis"
        {
            let vc = segue.destination as! HealthAnalysis
            vc.date = list[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "RecordToAnalysis", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCellEditingStyle,forRowAt indexPath: IndexPath){
        var outString : String = ""
        do {
            let path = NSHomeDirectory() + "/Documents/Record.txt"
            let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
            var count = 0
            content.enumerateLines({ (line, stop) -> () in
                if count != indexPath.row
                {
                    outString += line + "\n"
                }
                count+=1
            })
            
            try outString.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
        } catch {
            print("Error:", error.localizedDescription)
        }
        
        list.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath:IndexPath)->String?
    {
        return "刪除"
    }
    @IBOutlet weak var tableView: UITableView!
    
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
