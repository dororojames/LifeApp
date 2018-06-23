//
//  Settings.swift
//  生活APP
//
//  Created by Student on 2018/6/3.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

//表格數據實體類

class Settings: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate{
    
    //表格
    var tableView:UITableView?

    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    func setCell(cell: HealthSettingsTableViewCell,indexPathrow :Int) {
        
        cell.textLav.text = user.getData(row: indexPathrow)
        cell.textLav?.placeholder = user.getInformation(row: indexPathrow)
        cell.textLav?.autocorrectionType = UITextAutocorrectionType.no
        cell.textLav?.autocapitalizationType = UITextAutocapitalizationType.none
        cell.textLav?.adjustsFontSizeToFitWidth = true;
        
        cell.textLabel?.text = user.getInformation(row: indexPathrow)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section :Int) ->String?{
        return "健康資料"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.getInformation().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HealthSettingsTableViewCell
        cell.textLav?.delegate = self
    
        user.loadData(filename: "userinfo", indexPathrow: indexPath.row)
        
        setCell(cell: cell, indexPathrow: indexPath.row)
        
        return cell
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let indexOf = user.getInformation().index(of: textField.placeholder)
        if(textField.placeholder! == user.getInformation(row: indexOf!)){
            if( indexOf! <= (user.getData().count-1)){
                user.deleteData(row: indexOf!)
            }
            user.insertData(row: indexOf!, string: textField.text!)
        }
        //writing
        // If the directory was found, we write a file to it and read it back
                
        // Write to the file named Test
        user.writeData(filename: "userinfo", indexPathrow: indexOf!)
    }
    
    //delegate method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
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
