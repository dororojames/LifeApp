//
//  HealthTest.swift
//  生活APP
//
//  Created by Student on 2018/6/3.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class HealthTest: UIViewController {
    @IBOutlet weak var questionDescription: UILabel!
    
    var count = 1
    var test = TestFacade()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionDescription.text = test.getTest(id: 0).getQuestion().getDescription()
    }
    @IBAction func yes(_ sender: Any) {
        if (judge(fine: false)==false) {
            self.performSegue(withIdentifier: "TestToResult", sender: sender)
        }
    }

    @IBAction func no(_ sender: Any) {
        if (judge(fine: true)==false) {
            self.performSegue(withIdentifier: "TestToResult", sender: sender)
        }
    }
    
    func judge(fine: Bool) -> Bool{
        if (count<test.getNumtest()) {
            test.diagnose(id: count-1, fine: fine)
            questionDescription.text = test.getTest(id: count).getQuestion().getDescription()
            count+=1
            return true
        }
        else
        {
            test.diagnose(id: count-1, fine: fine)
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TestToResult"
        {
            var medicine = [String]()
            
            var date : String
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy_M_d H_m_s"
            date = formatter.string(from: Date())
            
            let vc = segue.destination as! TestResult
            if(test.getNumPrescription() != 0)
            {
                for i in 0 ... test.getNumPrescription()-1
                {
                    medicine.append(test.getMedicine(id: i).getName())
                }
            }
            else
            {
                medicine.append("蓮子")
            }
            vc.record = Record(date: date, condition: test.diagnose(score: test.getScore()) , medicine: medicine)
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
