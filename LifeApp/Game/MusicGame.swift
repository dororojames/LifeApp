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
    var itemString:String?
    var audioPlayer: AVAudioPlayer!
    var hit=0
    var miss=0
    var EndCount=15
    struct shape{
        var lab:UILabel = UILabel()
        var used:Bool = false
    }
    /* var shape = [UILabel](repeating: UILabel(), count: 15)*/
    var Shape=[shape](repeating: shape(), count: 24)
    
    var timer=Timer()
    func timerStart(){
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        
    }
    @IBOutlet weak var HitMean: UILabel!
    @IBOutlet weak var MissMean: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareAudioFile()
        audioPlayer.play()
        sleep(2)
        hit=0
        miss=0
        EndCount=10
        timerStart()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func updateTime(){
        if audioPlayer.isPlaying==true{
            let randomNum = Int(arc4random_uniform(40))
            
            if randomNum<24 && !(self.Shape[randomNum].used){
                var dx:Float
                var text:String
                
                if randomNum%3==0{
                    dx=104
                    text="<-"
                }
                else if randomNum%3==1{
                    dx=222
                    text="X"
                }
                else {
                    dx=327.4
                    text="->"
                }
                self.Shape[randomNum].lab = UILabel(frame: CGRect(x: 120, y: 100, width: 50, height: 50))
                self.Shape[randomNum].used=true
                self.Shape[randomNum].lab.text=text
                self.Shape[randomNum].lab.font=UIFont.systemFont(ofSize:24)
                self.Shape[randomNum].lab.textColor=UIColor.red
                self.Shape[randomNum].lab.center.x=CGFloat(dx)
            }
        }
        for index in 0...23 {
            // print(self.Shape[index].used)
            if self.Shape[index].used{
                
                self.Shape[index].lab.center.y+=12.5
                if(self.Shape[index].lab.center.y>=670)
                {
                    self.Shape[index].lab.center.y=100
                    self.Shape[index].lab.removeFromSuperview()
                    self.Shape[index].used=false
                    miss=miss+1
                    MissMean.text=String(miss)
                }
                else
                {
                    self.view.addSubview(Shape[index].lab)
                }
            }
        }
        
        if audioPlayer.isPlaying==false{
            EndCount=EndCount-1
            if EndCount==0{
                timer.invalidate()
                let UserDefault=UserDefaults.standard
                var BestHit=UserDefault.integer(forKey: "BestHitNum")
                
                if hit>BestHit{BestHit=hit}
                UserDefault.set(hit,forKey:"HitNum")
                UserDefault.set(BestHit,forKey:"BestHitNum")
                UserDefault.set(miss,forKey:"MissNum")
                
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "TempoRecord") as! TempoRecord
                self.present(controller, animated: false, completion: nil)
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareAudioFile() {
        let url = Bundle.main.url(forResource:itemString, withExtension: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer.prepareToPlay()
        } catch {
            print("Error:", error.localizedDescription)
        }
    }
    
    @IBAction func leftclick(_ sender: Any) {
        for i in 0...23{
            if i%3==0 && self.Shape[i].lab.center.y>596{
                if self.Shape[i].lab.center.y>=610&&self.Shape[i].lab.center.y<650{
                    hit=hit+1
                    HitMean.text=String(hit)
                    self.Shape[i].lab.center.y=100
                    self.Shape[i].lab.removeFromSuperview()
                    self.Shape[i].used=false
                }
                else
                {
                    miss=miss+1
                    MissMean.text=String(miss)
                    self.Shape[i].lab.center.y=100
                    self.Shape[i].lab.removeFromSuperview()
                }
            }
            
        }
    }
    @IBAction func midClick(_ sender: Any) {
        for i in 0...23{
            if i%3==1 && Shape[i].lab.center.y>596{
                if self.Shape[i].lab.center.y>=610&&self.Shape[i].lab.center.y<650{
                    hit=hit+1
                    HitMean.text=String(hit)
                    self.Shape[i].lab.center.y=100
                    self.Shape[i].lab.removeFromSuperview()
                    self.Shape[i].used=false
                }
                else
                {
                    miss=miss+1
                    MissMean.text=String(miss)
                    self.Shape[i].lab.center.y=100
                    self.Shape[i].lab.removeFromSuperview()
                }
            }
        }
        
    }
    @IBAction func rightClick(_ sender: Any) {
        for i in 0...23{
            if i%3==2 && self.Shape[i].lab.center.y>596{
                if self.Shape[i].lab.center.y>=610&&self.Shape[i].lab.center.y<650{
                    hit=hit+1
                    HitMean.text=String(hit)
                    self.Shape[i].lab.center.y=100
                    self.Shape[i].lab.removeFromSuperview()
                    self.Shape[i].used=false
                }
                else
                {
                    miss=miss+1
                    MissMean.text=String(miss)
                    self.Shape[i].lab.center.y=100
                    self.Shape[i].lab.removeFromSuperview()
                }
            }
        }
        
    }
    @IBAction func ReBack(_ sender: Any) {
        audioPlayer.stop()
        timer.invalidate()
    }
}
