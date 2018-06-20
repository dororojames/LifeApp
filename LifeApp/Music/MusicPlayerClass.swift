//
//  MusicPlayerClass.swift
//  LifeApp
//
//  Created by Student on 2018/6/19.
//  Copyright © 2018年 Student. All rights reserved.
//

import Foundation
import MediaPlayer
class MusicPlayer{
    var player:MPMusicPlayerController
    var isPlaying:Bool=false
    var isRandom:Bool=false
    var isRepeat:Int=0
    var currentSecond:Float=0.0
    init() {
        self.player=MPMusicPlayerController.applicationMusicPlayer
        self.isPlaying=false
        self.isRandom=false
        self.isRepeat=0
        self.currentSecond=0.0
    }
    func playMusic(){
        player.play()
        self.isPlaying = true
    }
    func pauseMusic(){
        player.pause()
        self.isPlaying = false
    }
    func nextMusic(){
        player.skipToNextItem()
        currentSecond = 0.0
    }
    func previousMusic(){
        player.skipToPreviousItem()
        currentSecond = 0.0
    }
}
