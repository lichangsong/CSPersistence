//
//  CSPersistanceQueryCommand.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation
import FMDB

class CSPersistanceQueryCommand: NSObject {
    
    var persistanceData: CSPersistanceDataBase?
    var dataBaseName: String
    
    init(name: String) {
        self.dataBaseName = name
        persistanceData = CSPersistanceDataBase(name: name)
    }
    
    deinit {
        close()
    }
    // 关闭数据库
    func close() -> Void {
        self.persistanceData!.database.close()
    }
    
    /**
     根据数组参数执行数据库的查询操作
     
     - parameter query: SQL语句
     - parameter args:  条件参数
     
     - returns: 查询的结果
     */
    func database(query: String, withArgumentsInArray args: [AnyObject]?) -> [AnyObject] {
        
        var rstArray:[AnyObject] = []
        self.persistanceData!.database.inTransaction { (db: FMDatabase!, rollback: UnsafeMutablePointer<ObjCBool>) -> Void in
            
            if let rst = db.executeQuery(query, withArgumentsInArray: args) {
                while rst.next() {
                    rstArray.append(rst.resultDictionary())
                }
                rst.close()
            }
        }
        return rstArray
    }
    /**
     根据字典参数执行数据库更新事务
     
     - parameter execute: SQL语句
     - parameter args:    参数
     
     - returns: 执行是否成功
     */
    func database(execute: String, withArgumentsInDictionary args: [String: AnyObject]!) -> Bool {
        var isSuccess = false
        self.persistanceData!.database.inTransaction { (db: FMDatabase!, rollback: UnsafeMutablePointer<ObjCBool>) -> Void in
            
            isSuccess = db.executeUpdate(execute, withParameterDictionary: args)
        }
        return isSuccess
    }
    
    /**
     根据数组参数数据库更新事务
     
     - parameter execute: SQL语句
     - parameter args:    参数
     
     - returns: 执行是否成功
     */
    func execute(execute: String, withArgumentsInArray args: [AnyObject]!) -> Bool {
        var isSuccess = false
        self.persistanceData!.database.inTransaction { (db: FMDatabase!, rollback: UnsafeMutablePointer<ObjCBool>) -> Void in
            isSuccess = db.executeUpdate(execute, withArgumentsInArray: args)
        }
        return isSuccess
    }
    
}
