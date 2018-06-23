//
//  Test.swift
//  LifeApp
//
//  Created by Student on 2018/6/20.
//  Copyright © 2018年 Student. All rights reserved.
//

import Foundation

class Test{
    private var medicine : Medicine
    private var question : Question
    init(question:Question, medicine:Medicine) {
        self.question = question
        self.medicine = medicine
    }
    func getMedicine() -> Medicine! {
        return medicine
    }
    func getQuestion() -> Question! {
        return question
    }
}
class TestFacade{
    private static var num = 3
    private var test = [Test]()
    private var questionlist = QuestionList(num: 3)
    private var medicinelist = MedicineList(num: 3)
    private var prescription = [Medicine]()
    private var score = 0
    init() {
        for _ in 0...3 {
            var question : Question
            question = questionlist.generateRandomQuestion()
            let temp = Test(question: question, medicine: diagnose(id: question.getID())!)
            test.append(temp)
        }
    }
    func diagnose(id: Int) -> Medicine? {
        for i in 0 ... medicinelist.getNumMedicine()-1
        {
            if(id==i)
            {
                return medicinelist.getMedicine(id:i)
            }
        }
        return nil
    }
    func diagnose(id : Int, fine: Bool){
        if (fine==true) {
            score += 30
        }
        else
        {
            let medicine = test[id].getMedicine()
            prescription.append(medicine!)
        }
    }
    func diagnose(score: Int) -> String! {
        if(score>=60)
        {
            return "健康良好"
        }
        else
        {
            return "健康不良"
        }
    }
    func getNumtest() -> Int {
        return test.count
    }
    func getTest(id: Int) -> Test {
        return test[id]
    }
    func getPrescription() -> [Medicine] {
        return prescription
    }
    func getNumPrescription() -> Int {
        return prescription.count
    }
    func getMedicine(id: Int) -> Medicine {
        return prescription[id]
    }
    func getScore() -> Int {
        return score
    }
}
