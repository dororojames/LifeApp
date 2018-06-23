//
//  MusicGame.swift
//  LifeApp
//
//  Created by Student on 2018/6/19.
//  Copyright © 2018年 Student. All rights reserved.
//
import UIKit
import Foundation
import AVFoundation

struct shape{
    var lab:UILabel = UILabel()
    var used:Bool = false
}

class MusicGame{
    var audioPlayer: AVAudioPlayer!
    var hit=0
    var miss=0
    var timer=Timer()
    var Shape=[shape](repeating: shape(), count: 24)
    //準備音樂
    func prepareAudioFile(itemString:String) {
        let url = Bundle.main.url(forResource:itemString, withExtension: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer.prepareToPlay()
        } catch {
            print("Error:", error.localizedDescription)
        }
    }
    //符號生成
    func MusicShapeGenerate(){
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
    //紀錄
    func MusicGameRecordSave(){
        timer.invalidate()
        let UserDefault=UserDefaults.standard
        var BestHit=UserDefault.integer(forKey: "BestHitNum")
        
        if hit>BestHit{BestHit=hit}
        UserDefault.set(hit,forKey:"HitNum")
        UserDefault.set(BestHit,forKey:"BestHitNum")
        UserDefault.set(miss,forKey:"MissNum")
    }
    
    func ShapeOperateInGame(index:Int)->Bool{
        self.Shape[index].lab.center.y+=12.5
        if(self.Shape[index].lab.center.y>=665)
        {
            self.Shape[index].lab.center.y=100
            self.Shape[index].lab.removeFromSuperview()
            self.Shape[index].used=false
            miss=miss+1
            return true
        }
        return false
    }
    
    func HitMissDetermination(DirBtn:Int,i:Int)->Bool{
        if self.Shape[i].lab.center.y>=610&&self.Shape[i].lab.center.y<650{
            hit=hit+1
            self.Shape[i].lab.center.y=100
            self.Shape[i].lab.removeFromSuperview()
            self.Shape[i].used=false
            return true
        }
        miss=miss+1
        self.Shape[i].lab.center.y=100
        self.Shape[i].lab.removeFromSuperview()
        return false
    }
}
