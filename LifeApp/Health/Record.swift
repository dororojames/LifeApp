//
//  Record.swift
//  LifeApp
//
//  Created by Student on 2018/6/19.
//  Copyright © 2018年 Student. All rights reserved.
//

import Foundation

class Record{
    private var date : String = ""
    private var condition : String = ""
    private var medicine : String
    init(date: String, condition: String, medicine: String) {
        self.condition = condition
        self.date = date
        self.medicine = medicine
    }
    func getDate() -> String {
        return date
    }
    func getCondition() -> String {
        return condition
    }
    func getMedicine() -> String {
        return medicine
    }
    func saveRecord(score: Int,condition: String, medicine: [Medicine]){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy_M_d H_m_s"
        date = formatter.string(from: Date())
        let condition = diagnose(score: score)
        
        do {
            let path = NSHomeDirectory() + "/Documents/" + date + ".txt"
            var outString = ""
            outString += condition! + "\n"
            for i in 0 ... medicine.count-1
            {
                outString += medicine[i].getMedicine() + " "
            }
            try outString.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
        } catch {
            print("Error:", error.localizedDescription)
        }
    }
    func loadRecord(date:String) -> Record?{
        do {
            var medicine : String = ""
            var condition : String = ""
            let path = NSHomeDirectory() + "/Documents/" + date + ".txt"
            let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
            content.enumerateLines({ (line, stop) -> () in
                if(line == "健康良好" || line == "健康不良")
                {
                    condition = line
                }
                else if(line != "nil")
                {
                    medicine = line
                }
            })
            let record = Record(date: date, condition: condition, medicine: medicine)
            return record
        } catch {
            print("Error:", error.localizedDescription)
        }
        return nil
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
}
class RecordList{
    private var recordlidst = [Record]()
    init() {
        var list = [String]()
        do {
            let path = NSHomeDirectory() + "/Documents/Record.txt"
            let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
            content.enumerateLines({ (line, stop) -> () in
                list.append(line)
            })
        } catch {
            print("Error:", error.localizedDescription)
        }
        if(list.count>0)
        {
            for i in 0 ... list.count-1
            {
                var record = Record(date: "", condition: "", medicine: "")
                record = record.loadRecord(date: list[i])!
                recordlidst.insert(record, at: 0)
            }
        }
    }
    func getRecord(id: Int) -> Record {
        return recordlidst[id]
    }
    func getNumRecord() -> Int {
        return recordlidst.count
    }
    func deleteRecord(id: Int){
        recordlidst.remove(at: id)
    }
}
