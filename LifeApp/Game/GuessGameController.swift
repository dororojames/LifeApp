//
//  SecondViewController.swift
//  GamePart
//
//  Created by Student on 2018/6/4.
//  Copyright © 2018年 Ｋ. All rights reserved.
//

import UIKit

class GuessGameController: UIViewController {

    
    
    
    var totalTime = 0
    var timer = Timer()
    var GuessNum = ""
    var compareNum=[0,0,0,0]
    var answer = [0,0,0,0]
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var TimeLabel: UILabel!
    func timerStart(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        
    }
    
    @IBOutlet weak var one: UILabel!

    @IBAction func SendGuessNum(_ sender: Any) {
        GuessNum=input.text!
        if GuessNum.count<4 || GuessNum.count>4{
            print("長度不合")
        }
        else{
            
        let sub1=GuessNum.index(GuessNum.startIndex, offsetBy: 0)
        let sub2=GuessNum.index(GuessNum.startIndex, offsetBy: 1)
        let sub3=GuessNum.index(GuessNum.startIndex, offsetBy: 2)
        let sub4=GuessNum.index(GuessNum.startIndex, offsetBy: 3)
            if GuessNum[sub1]==GuessNum[sub2]||GuessNum[sub1]==GuessNum[sub3]||GuessNum[sub1]==GuessNum[sub4]||GuessNum[sub3]==GuessNum[sub2]||GuessNum[sub4]==GuessNum[sub2]||GuessNum[sub3]==GuessNum[sub4]{
                print("error")
                }
                else
                {
                    var num=Int(GuessNum)!
                    for i in 0...3 {
                        compareNum[3-i]=num%10
                        num=num/10
                        
                    }
                    print(compareNum)
                }
            
            
            }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input.keyboardType = .numberPad
        initial()
        timerStart()
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    func initial(){
        var nums = Array(0...9)
        for i in 0...3 {
            let index = Int(arc4random_uniform(UInt32(nums.count)))
            answer[i] = nums[index]
            nums.remove(at: index)
        }
        TimeLabel.text = "0:00"
        totalTime = 0
    }
    
    @objc func updateTime(){
        totalTime += 1
        TimeLabel.text = String(totalTime/60) + ":" + String(format: "%02d", totalTime%60)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

