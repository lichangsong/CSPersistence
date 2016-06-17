//
//  UserRecode.swift
//  TestPersistance
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation

class UserRecode: CSPersistanceRecord {
    
    var user_name: String?
    // 变量类型禁止使用基础类型
    var user_id: NSNumber?
    var user_sex: String?
    var user_married: NSNumber?
    
    override init() {
        super.init()
    }
    
    init(name: String, uid: NSNumber) {
        self.user_name = name
        self.user_id = uid
        super.init()
    }
    override func dictionaryRepresentationInTable(table: CSPersistanceTableProtocol) -> [String : AnyObject]? {
        if table is UserTable {
            return [
                "user_id" : self.user_id!,
                "user_name" : self.user_name!
//                "user_married" : self.user_married!,
//                "user_sex" : self.user_sex!
            ]
        }
        return nil
    }
    override func dictionaryRepresentationUpdateInTable(table: CSPersistanceTableProtocol) -> [String : AnyObject]? {
        if table is UserTable {
            return [
                "user_id": self.user_id!,
                "user_name": self.user_name!
            ]
        }
        return nil
    }
}

