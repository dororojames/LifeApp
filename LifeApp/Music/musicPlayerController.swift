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
    
    var music = MusicPlayer()
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
        music.player.currentPlaybackTime = Double(sender.value)
        currentSecond = Double(sender.value)
    }
    
    @IBAction func random(_ sender: UIButton) {
//        if sender.title(for: .normal) == "順序"{
//            music.shuffleMode = .off
//            sender.setTitle("隨機", for: .normal)
//        }
//        else{
//            music.shuffleMode = .songs
//            sender.setTitle("順序", for: .normal)
//        }
        if music.player.shuffleMode == .songs{
            music.player.shuffleMode = .off
        }
        else{
            music.player.shuffleMode = .songs
        }
    }
    
    @IBAction func repeatAct(_ sender: UIButton) {
        if sender.title(for: .normal) == "循環播放"{
            music.player.repeatMode = .all
            sender.setTitle("單曲循環", for: .normal)
        }
        else if sender.title(for: .normal) == "單曲循環"{
            music.player.repeatMode = .one
            sender.setTitle("不循環", for: .normal)
        }
        else{
            music.player.repeatMode = .none
            sender.setTitle("循環播放", for: .normal)
        }
    }
    
    @IBAction func playBtnAction(_ sender: AnyObject) {
        if music.isPlaying == false{
            music.playMusic()
            progressTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(musicPlayerController.updateTime), userInfo: nil, repeats: true)
            refreshPlayBtn()
        }
        else{
            music.pauseMusic()
            progressTimer?.invalidate()
            refreshPlayBtn()
        }
    }
    @IBAction func next(_ sender: Any) {
        music.nextMusic()
        refreshInfo()
    }
    @IBAction func previous(_ sender: Any) {
        music.previousMusic()
        refreshInfo()
    }
    @objc func updateTime(){
        music.currentSecond += 1
        musicProgress.setValue(music.currentSecond, animated: true)
    }
    @objc func refreshPlayBtn(){
        if music.isPlaying == false{
            playBtn.setImage(#imageLiteral(resourceName: "stopMusic"), for: .normal)
            progressTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(musicPlayerController.updateTime), userInfo: nil, repeats: true)
        }
        else{
            playBtn.setImage(#imageLiteral(resourceName: "playmusic"), for: .normal)
        }
    }
    @objc func refreshInfo(){
        if songCnt != 0{
            //slider 最大值
            musicProgress.maximumValue = Float((music.player.nowPlayingItem?.playbackDuration)!)
            let songName = music.player.nowPlayingItem?.title
            let artist = music.player.nowPlayingItem?.artist
            
            //        畫面上的資訊
            self.songName.text = songName
            self.singerName.text = artist
            self.image.image=music.player.nowPlayingItem?.artwork?.image(at: CGSize.init(width: 150, height: 150))
//            if playBtn.title(for: .normal)=="暫停"{
//                progressTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(musicPlayerController.updateTime), userInfo: nil, repeats: true)
//            }
            refreshPlayBtn()
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
