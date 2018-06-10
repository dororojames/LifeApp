//
//  musicPlayerController.swift
//  music
//
//  Created by Student on 2018/6/5.
//  Copyright © 2018年 Student. All rights reserved.
//
import UIKit
import MediaPlayer

class musicPlayerController: UIViewController {
    
    var music=MPMusicPlayerController.applicationMusicPlayer
    var songCnt:Int?
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var singerName: UILabel!
    @IBOutlet weak var musicProgress: UISlider!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var repeatBtn: UIButton!
    @IBOutlet weak var randomBtn: UIButton!
    @IBOutlet weak var image: UIImageView!
    var progressTimer: Timer?
    var currentSecond = 0.0
    override func viewWillAppear(_ animated: Bool) {refreshInfo()}
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(musicPlayerController.refreshInfo), name: NSNotification.Name.MPMusicPlayerControllerNowPlayingItemDidChange, object: nil)
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func progressChangeAct(_ sender: UISlider) {
        music.currentPlaybackTime = Double(sender.value)
        currentSecond = Double(sender.value)
    }
    
    @IBAction func random(_ sender: UIButton) {
        if sender.title(for: .normal) == "順序"{
            music.shuffleMode = .off
            sender.setTitle("隨機", for: .normal)
        }
        else{
            music.shuffleMode = .songs
            sender.setTitle("順序", for: .normal)
        }
    }
    
    @IBAction func repeatAct(_ sender: UIButton) {
        if sender.title(for: .normal) == "循環播放"{
            music.repeatMode = .all
            sender.setTitle("單曲循環", for: .normal)
        }
        else if sender.title(for: .normal) == "單曲循環"{
            music.repeatMode = .one
            sender.setTitle("不循環", for: .normal)
        }
        else{
            music.repeatMode = .none
            sender.setTitle("循環播放", for: .normal)
        }
    }
    
    @IBAction func playBtnAction(_ sender: AnyObject) {
        if sender.title(for: .normal)=="播放"{
            music.play()
            sender.setTitle("暫停",for: .normal)
            progressTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(musicPlayerController.updateTime), userInfo: nil, repeats: true)
        }
        else{
            music.pause()
            sender.setTitle("播放", for: .normal)
            progressTimer?.invalidate()
        }
    }
    
    @IBAction func next(_ sender: Any) {
        music.skipToNextItem()
        currentSecond=0.0
        refreshInfo()
    }
    @IBAction func previous(_ sender: Any) {
        music.skipToPreviousItem()
        currentSecond=0.0
        refreshInfo()
    }
    @objc func updateTime(){
        currentSecond += 1
        musicProgress.setValue(Float(currentSecond), animated: true)
    }
    
    @objc func refreshInfo(){
        if songCnt != 0{
            //slider 最大值
            musicProgress.maximumValue = Float((music.nowPlayingItem?.playbackDuration)!)
            let songName = music.nowPlayingItem?.title
            let artist = music.nowPlayingItem?.artist
            
            //        畫面上的資訊
            self.songName.text = songName
            self.singerName.text = artist
            self.image.image=music.nowPlayingItem?.artwork?.image(at: CGSize.init(width: 150, height: 150))
            if playBtn.title(for: .normal)=="暫停"{
                progressTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(musicPlayerController.updateTime), userInfo: nil, repeats: true)
            }
        }
        else{musicProgress.maximumValue = 0.0}
        musicProgress.setValue(Float(currentSecond), animated: true)
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
