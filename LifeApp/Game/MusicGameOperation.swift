//
//  MusicGame.swift
//  LifeApp
//
//  Created by Student on 2018/6/8.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit
import AVFoundation

class MusicGameController: UIViewController {
    var Records = MusicGame()
    var itemString:String?
    var EndCount=15
    var Left=0
    var Mid=1
    var Right=2
    
    /* var shape = [UILabel](repeating: UILabel(), count: 15)*/
    //var Shape=[shape](repeating: shape(), count: 24)
    
    var timer=Timer()
    func timerStart(){
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }
    @IBOutlet weak var HitMean: UILabel!
    @IBOutlet weak var MissMean: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Records.prepareAudioFile(itemString: itemString!)
        Records.audioPlayer.play()
        Records.hit=0
        Records.miss=0
        EndCount=18
        timerStart()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func updateTime(){
        if Records.audioPlayer.isPlaying==true{
            Records.MusicShapeGenerate()
        }
        for index in 0...23 {
            // print(self.Shape[index].used)
            if Records.Shape[index].used{
                if Records.ShapeOperateInGame(index: index){
                    Records.Shape[index].lab.removeFromSuperview()
                }
                else{
                    self.view.addSubview(Records.Shape[index].lab)
                }
            }
        }
        
        if Records.audioPlayer.isPlaying==false{
            EndCount=EndCount-1
            if EndCount==0{
                timer.invalidate()
                Records.MusicGameRecordSave()
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TempoRecord") as! TempoRecord
                self.present(controller, animated: false, completion: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* func prepareAudioFile() {
     let url = Bundle.main.url(forResource:itemString, withExtension: "mp3")
     
     do {
     Records.audioPlayer = try AVAudioPlayer(contentsOf: url!)
     Records.audioPlayer.prepareToPlay()
     } catch {
     print("Error:", error.localizedDescription)
     }
     }*/
    
    @IBAction func leftclick(_ sender: Any) {
        UIHitMissDetermination(DirBtn: Left)
    }
    @IBAction func midClick(_ sender: Any) {
        UIHitMissDetermination(DirBtn: Mid)
    }
    @IBAction func rightClick(_ sender: Any) {
        UIHitMissDetermination(DirBtn: Right)
    }
    @IBAction func ReBack(_ sender: Any) {
        Records.audioPlayer.stop()
        timer.invalidate()
    }
    func UIHitMissDetermination(DirBtn:Int){
        for i in 0...23{
            if i%3==DirBtn && Records.Shape[i].lab.center.y>596{
                if Records.HitMissDetermination(DirBtn: DirBtn,i: i){
                    HitMean.text=String(Records.hit)
                }
                else{
                    MissMean.text=String(Records.miss)
                }
            }
        }
    }
}
