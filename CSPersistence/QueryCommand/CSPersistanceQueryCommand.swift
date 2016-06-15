//
//  CSPersistanceQueryCommand.swift
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
import FMDB

public class CSPersistanceQueryCommand: NSObject {
    
    var persistanceData: CSPersistanceDataBase?
    var dataBaseName: String
    
    public init(name: String) {
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
