//
//  HealthTest.swift
//  生活APP
//
//  Created by Student on 2018/6/3.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class HealthTest: UIViewController {

    var score = 0
    var used : [Bool] = []
    var count = 1
    var medicine = [String]()
    let maxNum = 3
    var index = 0
    
    @IBOutlet weak var questionDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usedinitialize(num: maxNum)
        index = generteRandom()
        loadquestion(id: index)
    }
    @IBAction func yes(_ sender: Any) {
        if(count < 3)
        {
            let path = NSHomeDirectory() + "/Documents/Medicine" + String(index) + ".txt"
            do {
                let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
                medicine.append(content as String)
            } catch {
                print("Error:", error.localizedDescription)
            }
            index = generteRandom()
            loadquestion(id: index)
            count+=1
        }
        else
        {
            let path = NSHomeDirectory() + "/Documents/Medicine" + String(index) + ".txt"
            do {
                let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
                medicine.append(content as String)
            } catch {
                print("Error:", error.localizedDescription)
            }
            self.performSegue(withIdentifier: "TestToResult", sender: sender)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TestToResult"
        {
            let vc = segue.destination as! TestResult
            print(vc.medicine)
            if(medicine.count != 0)
            {
                for i in 0 ... medicine.count-1
                {
                    vc.medicine.append(medicine[i])
                }
            }
            vc.score = score
        }
    }
    
    @IBAction func no(_ sender: Any) {
        if(count<3)
        {
            score += 30
            index = generteRandom()
            loadquestion(id: index)
            count+=1
        }
        else
        {
            score += 30
            self.performSegue(withIdentifier: "TestToResult", sender: sender)
        }
    }
    
    func usedinitialize(num: Int)  {
        for _ in 1 ... num
        {
            used.append(false)
        }
    }
    func generteRandom() -> Int {
        var id : Int
        id = Int(arc4random_uniform(UInt32(maxNum)))
        while used[id]==true {
            id = Int(arc4random_uniform(UInt32(maxNum)))
        }
        used[id] = true
        id = id+1
        return id
    }
    
    func loadquestion(id : Int) {
        let path = NSHomeDirectory() + "/Documents/Question" + String(id) + ".txt"
        do {
            let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
            questionDescription.text = content as String
        } catch {
            print("Error:", error.localizedDescription)
        }
    }
    
    
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "放棄測驗", message: "是否放棄本次測驗？", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        let okAction = UIAlertAction(title: "確定", style: .destructive, handler: { action in
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            //點了確定後要做的事
        })
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
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
