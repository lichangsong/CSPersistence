//
//  CSPersistanceDataBase.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation
import FMDB

class CSPersistanceDataBase {
    // 数据库地址
    var path: String
    // FMDatabaseQueue
    var database: FMDatabaseQueue
    // 数据库名字
    var databaseName: String
    
    init(name: String) {
        self.databaseName = name
        self.path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! + "/" + self.databaseName
        self.database = FMDatabaseQueue(path: self.path)
    }
    
}