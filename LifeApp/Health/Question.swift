//
//  Question.swift
//  LifeApp
//
//  Created by Student on 2018/6/20.
//  Copyright © 2018年 Student. All rights reserved.
//

import Foundation

class Question{
    private var id : Int
    private var description : String
    init() {
        id = 0
        description = ""
    }
    init(description: String, id: Int) {
        self.description = description
        self.id = id
    }
    func loadQuestion(id: Int) -> Question? {
        let path = NSHomeDirectory() + "/Documents/Question" + String(id) + ".txt"
        do {
            let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
            let question = Question(description: content as String, id: id)
            return question
        } catch {
            print("Error:", error.localizedDescription)
        }
        return nil
    }
    func getID() -> Int {
        return id
    }
    func getDescription() -> String {
        return description
    }
}
class QuestionList{
    private var questionlist = [Question]()
    init(num: Int){
        for i in 0 ... num
        {
            var question = Question()
            question = question.loadQuestion(id: i)!
            self.questionlist.append(question)
        }
    }
    func deleteQuestion(id: Int){
       questionlist.remove(at: id)
    }
    func generateRandomQuestion() -> Question! {
        let id = generteRandom(num: questionlist.count-1)
        let question = questionlist[id]
        self.deleteQuestion(id: id)
        return question
    }
    func getNumQuestion() -> Int {
        return questionlist.count
    }
}
func generteRandom(num: Int) -> Int {
    return Int(arc4random_uniform(UInt32(num)))
}
