//
//  Medicine.swift
//  LifeApp
//
//  Created by Student on 2018/6/19.
//  Copyright © 2018年 Student. All rights reserved.
//

import Foundation

class Medicine{
    private var name: String
    init(name: String) {
        self.name = name
    }
    func getMedicine() -> String {
        return name
    }
}
