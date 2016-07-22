//
//  CSPersistanceTable.swift
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

public protocol CSPersistanceTableProtocol : NSObjectProtocol{
    // 数据库名字
    var databaseName: String? { get }
    // 表名字
    var tableName: String { get }
    // 表字段参数
    var tableColumnInfo: [String : String] { get }
    // 与Table配对的record
    var recordClass: CSPersistanceRecord { get }
}

public class CSPersistanceTable : NSObject {
    weak var child: CSPersistanceTableProtocol?
    public override init() {
        super.init()
        if self is CSPersistanceTableProtocol {
            self.child = (self as! CSPersistanceTableProtocol)
            let queryCommand = CSPersistanceQueryCommand(name: child!.databaseName!)
            queryCommand.createtable(child!.tableName, tableColumnInfo: child!.tableColumnInfo)
        } else {
            assert(false, "CSPersistanceTable must conform to TableProtocol")
        }
    }
    /**
     通用执行SQL
     
     - parameter sqlString: <#sqlString description#>
     
     - returns: <#return value description#>
     */
    public func executeSQL(sqlString: String) -> Bool {
        let queryCommand = CSPersistanceQueryCommand(name: child!.databaseName!)
        return queryCommand.database(sqlString, withArgumentsInDictionary: nil)
    }
    /**
     通用查询SQL
     
     - parameter sqlString: <#sqlString description#>
     
     - returns: <#return value description#>
     */
    public func fetchWithSQL(sqlString: String) -> [AnyObject] {
        let queryCommand = CSPersistanceQueryCommand(name: child!.databaseName!)
        return queryCommand.database(sqlString, withArgumentsInArray: nil)
    }
    
//    /**
//     将从数据库中查询的数据转换成CSPersistanceRecord数组
//
//     - parameter record:    Table.recordClass
//     - parameter baseArray: 查询得到的数据库字典
//
//     - returns: record 数组
//     */
//    public func transformSQLItemsToClass(record: CSPersistanceRecord, dataBaseArray: [[String : AnyObject]]?) -> [CSPersistanceRecord] {
//        var recordArray:[CSPersistanceRecord] = []
//        if dataBaseArray!.count > 0 {
//            for item in dataBaseArray! {
//                if record.respondsToSelector(#selector(CSPersistanceRecord.objectRepresentationWithDictionary(_:))) {
//                    record.objectRepresentationWithDictionary(item)
//                    recordArray.append(record)
//                }
//            }
//        }
//        return recordArray
//    }
}

