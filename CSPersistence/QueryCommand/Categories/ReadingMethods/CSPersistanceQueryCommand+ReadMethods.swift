//
//  CSPersistanceQueryCommand+ReadMethods.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation
// 读取操作
extension CSPersistanceQueryCommand {
    /**
     根据查询条件查询数据
     
     - parameter tableName: 数据库表名
     - parameter select:    查询语句
     - parameter condition: 查询条件
     
     - returns: 完整的查询SQL语句
     */
    func queryCommandWithTable(tableName: String, select: String?, condition: DatabaseCommandCondition) -> String {
        
        let selectSql = select == nil ? "*" : "'\(select!)'"
        var sql = "select \(selectSql) from \(tableName)"
        condition.applyConditionToCommand(&sql)
        
        return sql
    }
}

// 查询条件
class DatabaseCommandCondition: NSObject {
    
    var whereConditions: String?
    var orderBy: String?
    var isDESC: Bool?
    var limit: Int?
    var isDistinct: Bool?
    
    func applyConditionToCommand(inout command: String) {
        
        if self.whereConditions != nil{
            command.appendContentsOf(" where \(self.whereConditions!)")
        }
        if self.orderBy != nil {
            command.appendContentsOf(" order by \(self.orderBy!)")
        }
        if self.isDESC != nil {
            command.appendContentsOf(" \(self.isDESC! ? "DESC" : "ASC")")
        }
        if self.limit != nil {
            command.appendContentsOf(" limit \(self.limit!)")
        }
        //        if let isDistinct = self.isDistinct where isDistinct {
        //            command.replaceRange(Range(start: command.startIndex.advancedBy(6), end: command.startIndex.advancedBy(6)), with: " distinct")
        //        }
        // swift 3修改
        if let isDistinct = self.isDistinct where isDistinct {
            command.replaceRange(Range(command.startIndex.advancedBy(6)..<command.startIndex.advancedBy(6)), with: " distinct")
        }
    }
}