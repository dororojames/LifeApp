//
//  User.swift
//  LifeApp
//
//  Created by Student on 2018/6/19.
//  Copyright © 2018年 Student. All rights reserved.
//

import Foundation

class User{
    static let num_information = 6
    private var information = [String]()
    private var data = [String?](repeating: nil, count: num_information)
    init() {
        information.append("身高")
        information.append("體重")
        information.append("性別")
        information.append("血型")
        information.append("年齡")
        information.append("BMI")
    }
    func getInformation() -> [String?] {
        return information
    }
    func getInformation(row: Int) -> String? {
        return information[row]
    }
    func getData() -> [String?] {
        return data
    }
    func getData(row: Int) -> String? {
        return data[row]
    }
    func deleteData(row: Int) {
        data.remove(at: row)
    }
    func insertData(row: Int, string: String) {
        data.insert(string, at: row)
    }
    func loadData(filename: String,indexPathrow: Int) {
        let path = NSHomeDirectory() + "/Documents/" + filename + ".txt"
        do {
            let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
            var count = 0;
            content.enumerateLines({ (line, stop) -> () in
                if(count==indexPathrow)
                {
                    if(line != "nil")
                    {
                        self.deleteData(row: indexPathrow)
                        self.insertData(row: indexPathrow, string: line)
                    }
                }
                count+=1
            })
        } catch {
            print("Error:", error.localizedDescription)
        }
    }
    func writeData(filename: String,indexPathrow: Int){
        do {
            let path = NSHomeDirectory() + "/Documents/" + filename + ".txt"
            var outString = ""
            for i in 0 ... self.getInformation().count-1
            {
                if(self.getData(row: i) == nil)
                {
                    outString += "nil\n"
                }
                else
                {
                    outString += self.getData(row: i)!
                    outString += "\n"
                }
            }
            try outString.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
        } catch {
            print("Error:", error.localizedDescription)
        }
    }
}
