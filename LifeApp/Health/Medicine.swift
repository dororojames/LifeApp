//
//  Medicine.swift
//  LifeApp
//
//  Created by Student on 2018/6/19.
//  Copyright © 2018年 Student. All rights reserved.
//

import Foundation

class Medicine{
    private var id : Int
    private var name: String
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    func getID() -> Int {
        return id
    }
    func getName() -> String {
        return name
    }
}
class MedicineList{
    private var medicinelist = [Medicine]()
    init (num: Int){
        for i in 0 ... num
        {
            let path = NSHomeDirectory() + "/Documents/Medicine" + String(i) + ".txt"
            do {
                let content = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
                let medicine = Medicine(name: content as String, id: i)
                medicinelist.append(medicine)
            } catch {
                print("Error:", error.localizedDescription)
            }
        }
    }
    func getNumMedicine() -> Int {
        return medicinelist.count
    }
    func getMedicine(id: Int) -> Medicine {
        return medicinelist[id]
    }
}
