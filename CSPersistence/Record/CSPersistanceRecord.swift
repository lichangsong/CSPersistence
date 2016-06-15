//
//  CSPersistanceRecord.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation

class CSPersistanceRecord:NSObject,CSPersistanceRecordProtocol {

    func dictionaryRepresentationInTable(table: CSPersistanceTableProtocol) -> [String: AnyObject]? {
        
        return["":""]
    }
    
    func dictionaryRepresentationUpdateInTable(table: CSPersistanceTableProtocol) -> [String : AnyObject]? {
        return["":""]
    }
    /**
     获取对应的Table表需要插入的字段名数组(默认插入数据库表的全部字段)
     
     - parameter table: 遵循CSPersistanceTableProtocol的table
     
     - returns: 表的字段数组
     */
    func arrayColumnInTable(table: CSPersistanceTableProtocol) -> [String]? {
        var columnArray:[String] = []
        for columnKey in table.tableColumnInfo.keys {
            columnArray.append(columnKey)
        }
        return columnArray
    }
    /**
     将字典转换成Record对象(如果Record的类型为基础类型int,或者 bool时候，会因为基础类型没有setValue方法而引起崩溃，统一使用NSNumber)
     
     - parameter dictionary: 需要转换的数据库字典
     */
    func objectRepresentationWithDictionary(dictionary: [String : AnyObject]) {
        for (key,value) in dictionary {
            self.setValue(value, forKey: key)
        }
    }
    
}