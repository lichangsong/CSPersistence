//
//  CSPersistanceTable.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation

protocol CSPersistanceTableProtocol : NSObjectProtocol{
    // 数据库名字
    var databaseName: String? { get }
    // 表名字
    var tableName: String { get }
    // 表字段参数
    var tableColumnInfo: [String : String] { get }
    // 与Table配对的record
    var recordClass: CSPersistanceRecord { get }
}

class CSPersistanceTable : NSObject {
    weak var child: CSPersistanceTableProtocol?
    override init() {
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
    func executeSQL(sqlString: String) -> Bool {
        let queryCommand = CSPersistanceQueryCommand(name: child!.databaseName!)
        return queryCommand.database(sqlString, withArgumentsInDictionary: nil)
    }
    /**
     通用查询SQL
     
     - parameter sqlString: <#sqlString description#>
     
     - returns: <#return value description#>
     */
    func fetchWithSQL(sqlString: String) -> [AnyObject] {
        let queryCommand = CSPersistanceQueryCommand(name: child!.databaseName!)
        return queryCommand.database(sqlString, withArgumentsInArray: nil)
    }
    
    /**
     将从数据库中查询的数据转换成CSPersistanceRecord数组
     
     - parameter record:    Table.recordClass
     - parameter baseArray: 查询得到的数据库字典
     
     - returns: record 数组
     */
    func transformSQLItemsToClass(record: CSPersistanceRecord, dataBaseArray: [[String : AnyObject]]?) -> [CSPersistanceRecord] {
        var recordArray:[CSPersistanceRecord] = []
        if dataBaseArray!.count > 0 {
            for item in dataBaseArray! {
//                if record.respondsToSelector(Selector("objectRepresentationWithDictionary:")) {
                if record.respondsToSelector(#selector(CSPersistanceRecord.objectRepresentationWithDictionary(_:))) {
                    record.objectRepresentationWithDictionary(item)
                    recordArray.append(record)
                }
            }
        }
        return recordArray
    }
}
