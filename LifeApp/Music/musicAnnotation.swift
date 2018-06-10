//
//  musicAnnotation.swift
//  LifeApp
//
//  Created by Student on 2018/6/9.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class musicAnnotation: NSObject{
    var songName:String?
    var singer: String?
    var picture: UIImageView
    init(songName:String, singer:String, picture:UIImageView) {
        self.songName=songName
        self.singer=singer
        self.picture=picture
    }
}
