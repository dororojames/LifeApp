//
//  Edit.swift
//  LifeApp
//
//  Created by Student on 2018/6/7.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class Edit: UIViewController {
    var JokeTitleString:[String]=[]
    
    @IBOutlet weak var jokeTitle: UITextField!
    @IBOutlet weak var jokeContent: UITextView!
    
    @IBOutlet weak var score1Button: UIButton!
    @IBOutlet weak var score2Button: UIButton!
    @IBOutlet weak var score3Button: UIButton!
    var editJoke : Joke!
    @IBAction func cancel(_ sender: Any) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    @IBAction func score1(_ sender: Any) {
        editJoke.Score = 1
        score1Button.backgroundColor = UIColor.red
        score2Button.backgroundColor = UIColor.white
        score3Button.backgroundColor = UIColor.white
    }
    @IBAction func score2(_ sender: Any) {
        editJoke.Score = 2
        score1Button.backgroundColor = UIColor.white
        score2Button.backgroundColor = UIColor.red
        score3Button.backgroundColor = UIColor.white
    }
    @IBAction func score3(_ sender: Any) {
        editJoke.Score = 3
        score1Button.backgroundColor = UIColor.white
        score2Button.backgroundColor = UIColor.white
        score3Button.backgroundColor = UIColor.red
    }
    @IBAction func finished(_ sender: Any) {
        
//        func WriteFile(_ textField: UITextField) {
//            let indexOf = list.index(of:textField.placeholder!)
//            if(textField.placeholder! == list[indexOf!]){
//                if( indexOf! <= (allCellsText.count-1)){
//                    allCellsText.remove(at: indexOf!)
//                }
//                allCellsText.insert(textField.text!, at: indexOf!)
//            }
//            //writing
//            // If the directory was found, we write a file to it and read it back
//
//            // Write to the file named Test
            do {
                let path = NSHomeDirectory() + "/Documents/joke"+String(editJoke.Order!)+".txt"
                var writeIn = ""
                for i in 0 ... 3
                {
                    switch i
                    {
                    case 0:
                        writeIn += jokeTitle.text!
                    case 1:
                        writeIn += editJoke.jokeType!
                    case 2:
                        writeIn += String(editJoke.Score!)
                    case 3:
                        writeIn += jokeContent.text!
                    default:
                        print("Error")
                    }
                    writeIn += "\n"
                }
                try writeIn.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
            } catch {
                print("Error:", error.localizedDescription)
            }
    
        
        
        
        let notificationName = Notification.Name("GetUpdateNoti")

        //取畫面上的值
        editJoke.Name = jokeTitle.text
        editJoke.Content = jokeContent.text

        //發送通知
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["PASS":editJoke])

        //回到前一頁
        self.navigationController?.popViewController(animated: true)
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(editJoke.Score==1)
        {
            score1Button.backgroundColor = UIColor.red
        }
        else if(editJoke.Score==2)
        {
            score2Button.backgroundColor = UIColor.red
        }
        else
        {
            score3Button.backgroundColor = UIColor.red
        }
        
        jokeTitle?.text = editJoke?.Name
        jokeContent?.text = editJoke?.Content
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


