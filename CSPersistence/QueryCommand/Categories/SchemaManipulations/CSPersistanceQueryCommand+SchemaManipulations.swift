//
//  CSPersistanceQueryCommand+SchemaManipulations.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation

// 模式操作
extension CSPersistanceQueryCommand {
    /**
     根据表明以及表的字段，类型创建数据库表
     
     - parameter tableName:       数据库表名字
     - parameter tableColumnInfo: 字段以及类型
     
     - returns: 创建数据库是否成功
     */
    func createtable(tableName: String, tableColumnInfo: [String: String]) -> Bool {
        let params = NSMutableArray()
        
        for key in tableColumnInfo.keys {
            params.addObject("\(key) \(tableColumnInfo[key]!)")
        }
        
        let sql = "create table if not exists '\(tableName)' (\(params.componentsJoinedByString(",")))"
        // create table if not exists 'testTable' (user_name text default NULL,user_id Integer primary key)
        return self.database(sql,withArgumentsInDictionary: nil)
    }
    
    /**
     根据数据库表名删除数据（因为有if exists判断该方法通常情况下都会返回true）
     
     - parameter tableName: 数据库表名
     
     - returns: 返回执行是否成功
     */
    func dropTable(tableName: String) -> Bool {
        let sql = "DROP TABLE if exists '\(tableName)'"
        return self.database(sql,withArgumentsInDictionary: nil)
    }
    
    /**
     修改数据库结构，增加表字段
     
     - parameter tableName:  Table表名
     - parameter column:     字段名
     - parameter columnInfo: 字段类型
     
     - returns: 返回执行是否成功
     */
    func alterTableColumn(tableName: String, withColumName column: String, columnInfo: String) -> Bool{
        let sql = "ALTER TABLE \(tableName) ADD COLUMN \(column) \(columnInfo)"
        return self.database(sql,withArgumentsInDictionary: nil)
    }
    /**
     修改数据库结构，删除表字段(SQLLite不支持删除表字段（禁用）)
     
     - parameter tableName:  Table表名
     - parameter column:     字段名
     - parameter columnInfo: 字段类型
     
     - returns: 返回执行是否成功
     */
    func alterDropTableColum(tableName: String, withColumName column: String ) -> Bool {
        let sql = "ALTER TABLE \(tableName) drop COLUMN \(column)"
        return self.database(sql,withArgumentsInDictionary: nil)
    }

}