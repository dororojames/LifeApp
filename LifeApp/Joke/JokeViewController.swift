//
//  JokeViewController.swift
//  LifeApp
//
//  Created by Student on 2018/5/28.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController {


    @IBAction func unwindSegueBack_Favorite(for segue: UIStoryboardSegue) {
    }
  
    var jokelist = JokeList()
    let NAME = 0
    let JOKETYPE = 1
    let SCORE = 2
    let Like = 3
    let CONTENT = 4
    
    
    @IBAction func ToJokeType(_ sender: Any) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowJokeType"{
            let controller = segue.destination as! JokeType
            controller.jokelist = jokelist
        }
        else if segue.identifier == "ShowMyFavorite"{
            let controller = segue.destination as! myFavorite
            controller.jokelist = jokelist
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var Listname = [String](repeating: "", count: 4)
        Listname[jokelist.Adult]="Adult"
        Listname[jokelist.Qa]="QA"
        Listname[jokelist.Pun]="Pun"
        Listname[jokelist.Metaphor]="Metaphor"
        
        for i in 0...3
        {
            for j in 0...1
            {
                let path = NSHomeDirectory() + "/Documents/"+Listname[i]+String(j)+".txt"
                do {
                    var jokeTemp : Joke!
                    let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
                    var count = 0;
                    jokeTemp = Joke(Order: 0, Name: "", jokeType: "", Score: 0, Like: 0,Content: "")
                    
                    jokeTemp.setOrder(order: j)
                    content.enumerateLines({ (line, stop) -> () in
                        print(line)
                        switch count
                        {
                        case self.NAME:
                            jokeTemp.setName(name: line)
                        case self.JOKETYPE:
                            jokeTemp.jokeType=line
                        case self.SCORE:
                            jokeTemp.Score=Int(line)
                        case self.Like:
                            jokeTemp.Like=Int(line)
                        case self.CONTENT:
                            jokeTemp.setContent(content: line)
                        default:
                            print("Error")
                        }
                        count+=1
                    })
                    if(i==0)
                    {
                        self.jokelist.AdultListAppend(joke: jokeTemp)
                    }
                    else if(i==1)
                    {
                        self.jokelist.QaListAppend(joke: jokeTemp)
                    }
                    else if(i==2)
                    {
                        self.jokelist.PunListAppend(joke: jokeTemp)
                    }
                    else
                    {
                        self.jokelist.MetaphorListAppend(joke: jokeTemp)
                    }
                } catch {
                    print("Error:", error.localizedDescription)
                }
            }
        }
        
        
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }}
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }}
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }}}

