 //
 //  ViewController.swift
 //  music
 //
 //  Created by Student on 2018/6/5.
 //  Copyright © 2018年 Student. All rights reserved.
 //
 
 import UIKit
 import MediaPlayer
 class MusicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MPMediaPickerControllerDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    @IBOutlet weak var addMusic: UIButton!
    @IBOutlet weak var musicData: UITableView!
    var music = MusicPlayer()
    var selectSong: MPMediaItemCollection?
    @IBAction func unwindToPlayer(for segue: UIStoryboardSegue) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cnt = selectSong?.count{music.songCnt = cnt}
        return music.songCnt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "songlist",
                                          for: indexPath)
        let songName = cell.contentView.viewWithTag(1) as! UILabel
        let singer = cell.contentView.viewWithTag(2) as! UILabel
        let picture = cell.contentView.viewWithTag(3) as! UIImageView
        
        songName.text = selectSong?.items[indexPath.row].title
        singer.text = selectSong?.items[indexPath.row].artist
        picture.image = selectSong?.items[indexPath.row].artwork?.image(at: CGSize.init(width: 60, height: 60))
        return cell
    }
    
    @IBAction func addSong(_ sender: Any) {
        let mediaPicker = MPMediaPickerController(mediaTypes: MPMediaType.anyAudio)
        
        mediaPicker.delegate = self
        
        //允許多選
        mediaPicker.allowsPickingMultipleItems = true
        
        self.present(mediaPicker, animated: true, completion: nil)
    }
    
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        //取得選取的歌曲
        selectSong = mediaItemCollection
        for s in (selectSong?.items)!{
            print(s.title!)
        }
        //放入播放清單
        music.player.setQueue(with: selectSong!)
        music.player.shuffleMode = .off
        
        //離開選歌畫面
        self.dismiss(animated: true, completion: nil)
        musicData.reloadData()
        music.player.beginGeneratingPlaybackNotifications()
    }
    
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        //離開選歌畫面
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        music.player.nowPlayingItem = (selectSong?.items[indexPath.row])! as MPMediaItem
        music.playMusic()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! musicPlayerController
        controller.music = music
    }
 }
 
