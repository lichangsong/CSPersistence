//
//  MessageTable.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/22.
//  Copyright © 2016年 Li. All rights reserved.
//

//
//  UserTable.swift
//  TestPersistance
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation

class MessageTable : CSPersistanceTable,CSPersistanceTableProtocol {
    
    var databaseName: String? {
        get {
            return "messageBase"
        }
    }
    
    var tableName: String {
        get {
            return "messageTable"
        }
    }
    var tableColumnInfo: [String: String] {
        get {
            return [
                "message_id": "Integer primary key",
                "message_text": "text default NULL"
            ]
        }
    }
    var recordClass: CSPersistanceRecord {
        get{
            return MessageRecode()
        }
    }
}







