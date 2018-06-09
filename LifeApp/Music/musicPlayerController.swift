//
//  musicPlayerController.swift
//  music
//
//  Created by Student on 2018/6/5.
//  Copyright © 2018年 Student. All rights reserved.
//
import UIKit
import AVFoundation
import MediaPlayer

class musicPlayerController: UIViewController {

    var music=MPMusicPlayerController.applicationMusicPlayer
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var singerName: UILabel!
    @IBOutlet weak var musicProgress: UISlider!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var musicVolume: UISlider!
    var audioPlayer: AVAudioPlayer!
    var progressTimer: Timer?
    var defaultVol: Float = 0.5
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareAudioFile()
        musicProgress.minimumValue = 0
        musicProgress.maximumValue = Float(audioPlayer.duration)
        musicProgress.isContinuous = true
        musicProgress.addTarget(self,
                                action: #selector(self.progressChangeAct),
                                for: .touchUpInside)
        musicVolume.minimumTrackTintColor = UIColor.red
        musicVolume.maximumTrackTintColor = UIColor.gray
        musicVolume.minimumValue = 0
        musicVolume.maximumValue = 1
        musicVolume.value = defaultVol
        musicVolume.isContinuous = true
        

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func progressChangeAct(_ sender: UISlider) {
        audioPlayer.currentTime = TimeInterval(sender.value)
    }
    
    @IBAction func playBtnAction(_ sender: AnyObject) {
        audioPlayer.play()
        
        if progressTimer == nil {
            progressTimer = Timer.scheduledTimer(timeInterval: 1,
                                                 target: self,
                                                 selector: #selector(musicPlayerController.updateProgressSlider),
                                                 userInfo: nil,
                                                 repeats: true)
        }
    }
    @IBAction func updateProgressSlider(_ sender: AnyObject) {
        musicProgress.value = Float(audioPlayer.currentTime)
    }
    @IBAction func pauseBtnAction() {
        stopTimeInterval()
        audioPlayer.pause()
    }

    @IBAction func stopBtnAction(_ sender: Any) {
        stopTimeInterval()
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        musicProgress.value = 0
    }
    

    @IBAction func volumeChangeAct(_ sender: UISlider) {
        audioPlayer.volume = sender.value
    }
    func stopTimeInterval() {
        if progressTimer != nil {
            progressTimer?.invalidate()
            progressTimer = nil
        }
    }
    
    func prepareAudioFile() {
        let url = Bundle.main.url(forResource: "ISeeFire", withExtension: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer.prepareToPlay()
        } catch {
            print("Error:", error.localizedDescription)
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
