//
//  CSPersistanceQueryCommand+DataManipulations.swift
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
// 数据操作
extension CSPersistanceQueryCommand {
    
    func insertTable(tableName: String, columnList: [String]?) -> String {
        guard let columnList = columnList else{
            return ""
        }
        if columnList.count == 0 {
            return ""
        }
        var sql = "replace into \(tableName) ("
        
        let content = NSMutableArray()
        let values = NSMutableArray()
        
        for key in columnList {
            content.addObject("\(key)")
            values.addObject(":\(key)")
        }
        sql += "\(content.componentsJoinedByString(","))) values (\(values.componentsJoinedByString(",")))"
        return sql
    }
    
    func deleteTable(tableName: String, withCondition: DatabaseCommandCondition) -> String{
        var sql = "delete from \(tableName)"
        withCondition.applyConditionToCommand(&sql)
        return sql
    }
    
    /**
     修改数据库表信息(该方法不会直接调用)
     update testTable set user_name = 'sdf' where user_id = 222
     注意: value 需要用单引号引起来
     - parameter tableName:     表名
     - parameter withCondition: 修改条件
     - parameter columnDic:     修改后的数据
     
     - returns: 返回操作数据库的字符串
     */
    func updateTable(tableName: String, withCondition: DatabaseCommandCondition, columnDic: [String : AnyObject]?) -> String {
        guard let columnDic = columnDic else{
            return ""
        }
        if columnDic.keys.count == 0 {
            return ""
        }
        var setSQL = ""
        for (key,value) in columnDic {
            setSQL = setSQL + key + " = " + "'\(value)'" + ","
        }
        var updateSQL = ""
        if columnDic.keys.count > 1 {
            let index = setSQL.startIndex.advancedBy(0) //swift 2.0+
            let index2 = setSQL.endIndex.advancedBy(-1) //swift 2.0+
            //            let range = Range<String.Index>(start: index,end: index2)
            // swift 3.0
            let range = Range<String.Index>(index..<index2)
            updateSQL = setSQL.substringWithRange(range)
        }
        var sql = "update \(tableName) set \(updateSQL) "
        withCondition.applyConditionToCommand(&sql)
        return sql
    }
    
}