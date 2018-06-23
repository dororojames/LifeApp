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
    private var medicine = [String]()
    init(date: String, condition: String, medicine: [String]) {
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
    func getMedicine() -> [String] {
        return medicine
    }
    func getMedicine(id: Int) -> String {
        return medicine[id]
    }
    func saveRecord(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy_M_d H_m_s"
        date = formatter.string(from: Date())
        
        do {
            let path = NSHomeDirectory() + "/Documents/" + date + ".txt"
            var outString = ""
            outString += condition + "\n"
            if (medicine.count>0) {
                for i in 0 ... medicine.count-1
                {
                    outString += medicine[i] + " "
                }
                try outString.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
            }
        } catch {
            print("Error:", error.localizedDescription)
        }
    }
    func loadRecord(date:String) -> Record?{
        do {
            var medicine = [String]()
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
                    medicine.append(line)
                }
            })
            let record = Record(date: date, condition: condition, medicine: medicine)
            return record
        } catch {
            print("Error:", error.localizedDescription)
        }
        print("error")
        return nil
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
                var record = Record(date: "", condition: "", medicine: [""])
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
    func insertRecord(record: Record){
        recordlidst.append(record)
    }
    func saveRecordList(){
        do {
            if(recordlidst.count>0)
            {
                let path = NSHomeDirectory() + "/Documents/Record.txt"
                var outString = ""
                for i in 0 ... recordlidst.count-1
                {
                    outString += recordlidst[i].getDate() + "\n"
                    try outString.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
                }
            }
        } catch {
            print("Error:", error.localizedDescription)
        }
    }
}
