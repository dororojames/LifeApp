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
    private var Score: Int?
    private var Like: Int?
    private var Content: String?
    init(Order: Int,Name: String,Score: Int,Like: Int,Content: String){
        self.Order=Order
        self.Name=Name
        self.Score=Score
        self.Content=Content
        self.Like=Like
    }
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
    func getScore()-> Int
    {
        return self.Score!
    }
    func setScore(score : Int)-> Void
    {
        self.Score=score
    }
    func getLike()-> Int
    {
        return self.Like!
    }
    func setLike(like : Int)-> Void
    {
        self.Like=like
    }
    func WriteJokeToFile(jokelist : JokeList,type : Int)-> Void
    {
        do {
            let path = NSHomeDirectory() + "/Documents/"+jokelist.Listname[type]+String(getOrder())+".txt"
            print("/Documents/"+jokelist.Listname[type]+String(getOrder())+".txt",type)
            var writeIn = ""
            for i in 0 ... 3
            {
                switch i
                {
                case 0:
                    writeIn += getName()
                case 1:
                    writeIn += String(getScore())
                case 2:
                    writeIn += String(getLike())
                case 3:
                    writeIn += getContent()
                default:
                    print("Error")
                }
                writeIn += "\n"
            }
            try writeIn.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
        } catch {
            print("Error:", error.localizedDescription)
        }
    }
}

class JokeList{
    let Adult=0
    let Qa=1
    let Pun=2
    let Metaphor=3
    var Listname = ["Adult","QA","Pun","Metaphor"]
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
    func LoadJokeFile()-> Void
    {
        for i in 0...3
        {
            for j in 0...2
            {
                var outString = ""
                let path = NSHomeDirectory() + "/Documents/"+Listname[i]+String(j)+".txt"
                do {
                    var jokeTemp : Joke!
                    let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
                    var count = 0;
                    jokeTemp = Joke(Order: 0, Name: "", Score: 0, Like: 0,Content: "")
                    
                    jokeTemp.setOrder(order: j)
                    content.enumerateLines({ (line, stop) -> () in
                        print(line)
                        switch count
                        {
                        case 0:
                            jokeTemp.setName(name: line)
                        case 1:
                            jokeTemp.setScore(score: Int(line)!)
                        case 2:
                            jokeTemp.setLike(like: Int(line)!)
                        default:
                            outString += line
                            outString += "\n"
                        }
                        
                        count+=1
                    })
                    jokeTemp.setContent(content: outString)
                    if(i==0)
                    {
                        AdultListAppend(joke: jokeTemp)
                    }
                    else if(i==1)
                    {
                        QaListAppend(joke: jokeTemp)
                    }
                    else if(i==2)
                    {
                        PunListAppend(joke: jokeTemp)
                    }
                    else
                    {
                        MetaphorListAppend(joke: jokeTemp)
                    }
                } catch {
                    print("Error:", error.localizedDescription)
                }
            }
        }
    }
}
