//
//  Joke.swift
//  LifeApp
//
//  Created by Student on 2018/6/6.
//  Copyright © 2018年 Student. All rights reserved.
//

import Foundation
class Joke{
    var Name: String?
    var jokeType: String?
    var Score: Int?
    init(Name: String,jokeType: String,Score: Int){
        self.Name=Name
        self.jokeType=jokeType
        self.Score=Score
    }
}
