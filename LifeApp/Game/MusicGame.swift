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
    
    @IBOutlet weak var testplaymusicbtn: UIButton!
    @IBOutlet weak var testlab: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        testlab.text=itemString

        // Do any additional setup after loading the view, typically from a nib.
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
    @IBAction func testbtn(_ sender: Any) {
            prepareAudioFile()
        audioPlayer.play()
    }
    
}
