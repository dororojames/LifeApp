//
//  Joke.swift
//  LifeApp
//
//  Created by Student on 2018/6/6.
//  Copyright © 2018年 Student. All rights reserved.
//

import Foundation
class Joke{
    private var Order: Int?
    private var Name: String?
    var jokeType: String?
    var Score: Int?
    var Like: Int?
    private var Content: String?
    func getOrder()-> Int
    {
        return self.Order!
    }
    func setOrder(order : Int)-> Void
    {
        self.Order=order
    }
    func getName()-> String
    {
        return self.Name!
    }
    func setName(name : String)-> Void
    {
        self.Name=name
    }
    func getContent()-> String
    {
        return self.Content!
    }
    func setContent(content : String)-> Void
    {
        self.Content=content
    }
    init(Order: Int,Name: String,jokeType: String,Score: Int,Like: Int,Content: String){
        self.Order=Order
        self.Name=Name
        self.jokeType=jokeType
        self.Score=Score
        self.Content=Content
        self.Like=Like
    }
}
class JokeList{
    let Adult=0
    let Qa=1
    let Pun=2
    let Metaphor=3
    var AdultList = [Joke]()
    var QaList = [Joke]()
    var PunList = [Joke]()
    var MetaphorList = [Joke]()
    var FavoriteList = [Joke]()
    func AdultListAppend(joke : Joke) -> Void{
        AdultList.append(joke)
    }
    func QaListAppend(joke : Joke) -> Void{
        QaList.append(joke)
    }
    func PunListAppend(joke : Joke) -> Void{
        PunList.append(joke)
    }
    func MetaphorListAppend(joke : Joke) -> Void{
        MetaphorList.append(joke)
    }
    func FavoriteListAppend(joke : Joke) -> Void{
        FavoriteList.append(joke)
    }
}
