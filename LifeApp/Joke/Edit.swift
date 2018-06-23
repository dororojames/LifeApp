//
//  Edit.swift
//  LifeApp
//
//  Created by Student on 2018/6/7.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit

class Edit: UIViewController {
    var JokeTitleString:[String]=[]
    var jokelist = JokeList()
    var type = 0
    var editJoke : Joke!
    @IBOutlet weak var jokeTitle: UITextField!
    @IBOutlet weak var jokeContent: UITextView!
    @IBOutlet weak var score1Button: UIButton!
    @IBOutlet weak var score2Button: UIButton!
    @IBOutlet weak var score3Button: UIButton!
    @IBAction func cancel(_ sender: Any) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    @IBAction func score1(_ sender: Any) {
        editJoke.setScore(score: 1)
        score1Button.backgroundColor = UIColor.red
        score2Button.backgroundColor = UIColor.white
        score3Button.backgroundColor = UIColor.white
    }
    @IBAction func score2(_ sender: Any) {
        editJoke.setScore(score: 2)
        score1Button.backgroundColor = UIColor.white
        score2Button.backgroundColor = UIColor.red
        score3Button.backgroundColor = UIColor.white
    }
    @IBAction func score3(_ sender: Any) {
        editJoke.setScore(score: 3)
        score1Button.backgroundColor = UIColor.white
        score2Button.backgroundColor = UIColor.white
        score3Button.backgroundColor = UIColor.red
    }
    @IBAction func finished(_ sender: Any) {
        let notificationName = Notification.Name("GetUpdateNoti")
        //取畫面上的值
        editJoke.setName(name: jokeTitle.text!)
        editJoke.setContent(content: jokeContent.text)
        //發送通知
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: ["PASS":editJoke])
        editJoke.WriteJokeToFile(jokelist: jokelist, type: type)
    self.navigationController?.popViewController(animated: true)
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(editJoke.getScore()==1)
        {
            score1Button.backgroundColor = UIColor.red
        }
        else if(editJoke.getScore()==2)
        {
            score2Button.backgroundColor = UIColor.red
        }
        else if(editJoke.getScore()==3)
        {
            score3Button.backgroundColor = UIColor.red
        }
        jokeTitle?.text = editJoke?.getName()
        jokeContent?.text = editJoke.getContent()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


