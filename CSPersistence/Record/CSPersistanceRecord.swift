//
//  CSPersistanceRecord.swift
//
//  Copyright (c) 2016 LiChangsong
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

public class CSPersistanceRecord:NSObject,CSPersistanceRecordProtocol {
    
    public func dictionaryRepresentationInTable(table: CSPersistanceTableProtocol) -> [String: AnyObject]? {
        
        return["":""]
    }
    
    public func dictionaryRepresentationUpdateInTable(table: CSPersistanceTableProtocol) -> [String : AnyObject]? {
        return["":""]
    }
    /**
     获取对应的Table表需要插入的字段名数组(默认插入数据库表的全部字段)
     
     - parameter table: 遵循CSPersistanceTableProtocol的table
     
     - returns: 表的字段数组
     */
    public func arrayColumnInTable(table: CSPersistanceTableProtocol) -> [String]? {
        var columnArray:[String] = []
        for columnKey in table.tableColumnInfo.keys {
            columnArray.append(columnKey)
        }
        return columnArray
    }
    
    public func reformData(manager: CSPersistanceTable, data: [[String : AnyObject]]) -> AnyObject {
        return ""
    }
    
//    /**
//     将字典转换成Record对象(如果Record的类型为基础类型int,或者 bool时候，会因为基础类型没有setValue方法而引起崩溃，统一使用NSNumber)
//
//     - parameter dictionary: 需要转换的数据库字典
//     */
//    public func objectRepresentationWithDictionary(dictionary: [String : AnyObject]) {
//        for (key,value) in dictionary {
//            self.setValue(value, forKey: key)
//        }
//    }
    
}