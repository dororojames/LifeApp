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
    override func viewWillAppear(_ animated: Bool) {refreshInfo()}
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(musicPlayerController.refreshInfo), name: NSNotification.Name.MPMusicPlayerControllerNowPlayingItemDidChange, object: nil)
        if let progressTimer = progressTimer{
            progressTimer.invalidate()
        }
        progressTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(musicPlayerController.refreshMusicProgress), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func progressChangeAct(_ sender: UISlider) {
        music.player.currentPlaybackTime = Double(sender.value)
    }
    
    @IBAction func random(_ sender: UIButton) {
        if music.songCnt != 0{
            if music.player.shuffleMode == .songs{
                music.player.shuffleMode = .off
            }
            else{
                music.player.shuffleMode = .songs
            }
            refreshRandomBtn()
        }
    }
    
    @IBAction func repeatAct(_ sender: UIButton) {
        if music.songCnt != 0{
            if music.player.repeatMode == .all{
                music.player.repeatMode = .one
            }
            else if music.player.repeatMode == .one{
                music.player.repeatMode = .none
            }
            else{
                music.player.repeatMode = .all
            }
            refreshReapeatBtn()
        }
    }
    
    @IBAction func playBtnAction(_ sender: AnyObject) {
        if music.songCnt != 0{
            if music.isPlaying == false{
                music.playMusic()
            }
            else{
                music.pauseMusic()
            }
            refreshPlayBtn()
        }
    }
    @IBAction func next(_ sender: Any) {
        if music.songCnt != 0{
            music.nextMusic()
            refreshInfo()
        }
    }
    @IBAction func previous(_ sender: Any) {
        if music.songCnt != 0{
            music.previousMusic()
            refreshInfo()
        }
    }
    @objc func refreshPlayBtn(){
        if music.isPlaying == false{
            playBtn.setImage(#imageLiteral(resourceName: "musicPlay"), for: .normal)
        }
        else{
            playBtn.setImage(#imageLiteral(resourceName: "musicStop"), for: .normal)
        }
    }
    @objc func refreshRandomBtn(){
        if music.player.shuffleMode == .songs{
            randomBtn.setImage(#imageLiteral(resourceName: "randomPlay"), for: .normal)
        }
        else{
            randomBtn.setImage(#imageLiteral(resourceName: "sequencePlay"), for: .normal)
        }
    }
    @objc func refreshReapeatBtn(){
        if music.player.repeatMode == .all{
            repeatBtn.setImage(#imageLiteral(resourceName: "RepeatAll"), for: .normal)
        }
        else if music.player.repeatMode == .one{
            repeatBtn.setImage(#imageLiteral(resourceName: "RepeatOne"), for: .normal)
        }
        else{
            repeatBtn.setImage(#imageLiteral(resourceName: "NotRepeat"), for: .normal)
        }
    }
    @objc func refreshMusicProgress(){
        musicProgress.setValue(Float(music.player.currentPlaybackTime), animated: true)
    }
    @objc func refreshInfo(){
        if music.player.isPreparedToPlay{
            //slider 最大值
            musicProgress.maximumValue = Float((music.player.nowPlayingItem?.playbackDuration)!)
            let songName = music.player.nowPlayingItem?.title
            let artist = music.player.nowPlayingItem?.artist
            
            //        畫面上的資訊
            self.songName.text = songName
            self.singerName.text = artist
            self.image.image=music.player.nowPlayingItem?.artwork?.image(at: CGSize.init(width: 150, height: 150))
            refreshPlayBtn()
            refreshRandomBtn()
            refreshReapeatBtn()
            refreshMusicProgress()
        }
        else{
            musicProgress.maximumValue = 0.0
            musicProgress.setValue(0.0, animated: true)
        }  
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
