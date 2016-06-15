//
//  CSPersistanceQueryCommand+ReadMethods.swift
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
// 读取操作
extension CSPersistanceQueryCommand {
    /**
     根据查询条件查询数据
     
     - parameter tableName: 数据库表名
     - parameter select:    查询语句
     - parameter condition: 查询条件
     
     - returns: 完整的查询SQL语句
     */
    public func queryCommandWithTable(tableName: String, select: String?, condition: DatabaseCommandCondition) -> String {
        
        let selectSql = select == nil ? "*" : "'\(select!)'"
        var sql = "select \(selectSql) from \(tableName)"
        condition.applyConditionToCommand(&sql)
        
        return sql
    }
}

// 查询条件
public class DatabaseCommandCondition: NSObject {
    
    public var whereConditions: String?
    public var orderBy: String?
    public var isDESC: Bool?
    public var limit: Int?
    public var isDistinct: Bool?
    
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