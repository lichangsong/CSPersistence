//
//  UserTable.swift
//  TestPersistance
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation

class UserTable : CSPersistanceTable,CSPersistanceTableProtocol {

     var databaseName: String? {
        get {
            return "testBase"
        }
    }
    
     var tableName: String {
        get {
            return "testTable"
        }
    }
     var tableColumnInfo: [String: String] {
        get {
            return [
                "user_id": "Integer primary key",
                "user_name": "text default NULL"
//                "user_married": "Boolean deault false",
//                "user_sex": "text dafault NULL"
            ]
        }
    }
     var recordClass: CSPersistanceRecord {
        get{
            return UserRecode()
        }
    }
}






