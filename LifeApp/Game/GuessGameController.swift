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
    var times=0
    
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var resultRecord: UITextView!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var TimeLabel: UILabel!
    func timerStart(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }
    
    @IBOutlet weak var one: UILabel!

    @IBAction func SendGuessNum(_ sender: Any) {
        GuessNum=input.text!
        if GuessNum.count<4 || GuessNum.count>4{
            resultRecord.text! += "請輸入4個不同的數字\n"
        }
        else{
    //input設置
        let sub1=GuessNum.index(GuessNum.startIndex, offsetBy: 0)
        let sub2=GuessNum.index(GuessNum.startIndex, offsetBy: 1)
        let sub3=GuessNum.index(GuessNum.startIndex, offsetBy: 2)
        let sub4=GuessNum.index(GuessNum.startIndex, offsetBy: 3)
            if GuessNum[sub1]==GuessNum[sub2]||GuessNum[sub1]==GuessNum[sub3]||GuessNum[sub1]==GuessNum[sub4]||GuessNum[sub3]==GuessNum[sub2]||GuessNum[sub4]==GuessNum[sub2]||GuessNum[sub3]==GuessNum[sub4]{
                resultRecord.text! += "請輸入4個不同的數字\n"
                }
                else
                {
                    var num=Int(GuessNum)!
                    for i in 0...3 {
                        compareNum[3-i]=num%10
                        num=num/10
                    }
                    var acount = 0
                    let bcount = 0
                    acount=GameResult(a: acount,_b: bcount)

                    if acount != 4 {
                        times=times+1
                        counter.text="\(times)"
                    }
                    else{
                        times+=1
                        timer.invalidate()
                        /*resultRecord.text! += "Game over &Go back to Menu"*/
                        //紀錄暫存
                        GameReccordSave()
                    }
                }
            }
        input.text!=""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input.keyboardType = .numberPad
        initial()
        timerStart()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initial(){
        //answer設置
        var nums = Array(0...9)
        for i in 0...3 {
            let index = Int(arc4random_uniform(UInt32(nums.count)))
            answer[i] = nums[index]
            nums.remove(at: index)
            print(answer)
        }
        resultRecord.text = ""
        TimeLabel.text = "0:00"
        totalTime = 0
        times=0
    }
    func GameResult(a: Int,_b: Int)->Int{ //跟答案配對並回答Ａ‘Ｂ
        var acount=a
        var bcount=_b
        for i in 0...3 {
            for j in 0...3 {
                if answer[i] == compareNum[j] {
                    if i == j {
                        acount += 1
                    }
                    else {
                        bcount += 1
                    }
                    break
                }
            }
        }
        resultRecord.text! += "\(compareNum[0])\(compareNum[1])\(compareNum[2])\(compareNum[3])\t\t\(acount)A\(bcount)B\n"
        resultRecord.scrollRangeToVisible(NSMakeRange(resultRecord.text.count-1, 0))
        return acount
    }
    func GameReccordSave(){
        let userDefaults = UserDefaults.standard
        var bestTime = userDefaults.integer(forKey: "BestTime")
        var bestCounter=userDefaults.integer(forKey: "BestCounter")
        if bestTime==0||totalTime<bestTime{
            bestTime=totalTime
        }
        
        if times<bestCounter||bestCounter==0{
            bestCounter=times
        }
        
        userDefaults.set(totalTime,forKey: "Totaltime")
        userDefaults.set(times,forKey: "Counter")
        userDefaults.set(bestTime,forKey:"BestTime")
        userDefaults.set(bestCounter,forKey:"BestCounter")
        userDefaults.synchronize()
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "RecordBoardView") as! RecordBoardView
        self.present(controller, animated: false, completion: nil)
        /* addRecord(numOfGuess: times, time: totalTime)*/
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

