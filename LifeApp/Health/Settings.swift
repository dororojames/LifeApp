//
//  Settings.swift
//  生活APP
//
//  Created by Student on 2018/6/3.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

//表格數據實體類

class Settings: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
    
    //表格
    var tableView:UITableView?

    var list = [String]()
    var allCellsText = [String?](repeating: nil, count:6)

    //開檔案
    var fileName = "information"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        list.append("身高")
        list.append("體重")
        list.append("性別")
        list.append("血型")
        list.append("年齡")
        list.append("BMI")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section :Int) ->String?{
        return "健康資料"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HealthSettingsTableViewCell
        cell.textLav?.delegate = self
        let url = Bundle.main.url(forResource: fileName, withExtension: "txt")
    
        //reading
        // Then reading it back from the file
        
            do {
                let content = try NSString(contentsOf: url!, encoding: String.Encoding.utf8.rawValue)
                var count = 0;
                content.enumerateLines({ (line, stop) -> () in
                    if(count==indexPath.row)
                    {
                        if(line != "nil")
                        {
                            cell.textLav.text = line as String?
                            self.allCellsText.remove(at: indexPath.row)
                            self.allCellsText.insert(line, at: indexPath.row)
                            print(self.allCellsText)
                        }
                    }
                    count+=1
                })
            } catch {
                print("Error:", error.localizedDescription)
            }
        
        cell.textLav?.placeholder = list[indexPath.row]
        cell.textLav?.autocorrectionType = UITextAutocorrectionType.no
        cell.textLav?.autocapitalizationType = UITextAutocapitalizationType.none
        cell.textLav?.adjustsFontSizeToFitWidth = true;
        
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let indexOf = list.index(of:textField.placeholder!)
        if(textField.placeholder! == list[indexOf!]){
            if( indexOf! <= (allCellsText.count-1)){
                allCellsText.remove(at: indexOf!)
            }
            allCellsText.insert(textField.text!, at: indexOf!)
            print(allCellsText)
        }
        //writing
        // If the directory was found, we write a file to it and read it back
                
        // Write to the file named Test
        do {
            let url = Bundle.main.url(forResource: fileName, withExtension: "txt")
            for i in 0 ... list.count-1
            {
                if(allCellsText[i] == nil)
                {
                    try "nil\n".write(to: url!, atomically: true, encoding: String.Encoding.utf8)
                }
                else
                {
                    let content = allCellsText[i]
                    try content!.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
                }
            }
        } catch {
            print("Error:", error.localizedDescription)
        }
    }
    
    //delegate method
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
