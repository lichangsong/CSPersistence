//
//  CSPersistanceRecordProtocol.swift
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
public protocol CSPersistanceRecordProtocol : NSObjectProtocol{
    /**
     插入数据时使用(待优化)
     存入数据库中字段和Value值
     - parameter table: 对应的表
     
     - returns: 数据库字段和与之对应的需要存入到数据库中的Value值
     */
    func dictionaryRepresentationInTable(table: CSPersistanceTableProtocol) -> [String: AnyObject]?
    /**
     更新数据时使用(待优化)
     修改数据库数据的字段和Value值
     - parameter table: 对应的表
     
     - returns: 需要修改数据的数据库字段以及与之对应的值
     */
    func dictionaryRepresentationUpdateInTable(table: CSPersistanceTableProtocol) -> [String: AnyObject]?
    
    func arrayColumnInTable(table: CSPersistanceTableProtocol) -> [String]?
    
    func reformData(manager: CSPersistanceTable, data: [[String : AnyObject]]) -> AnyObject
    
//    /**
//     将返回字典处理成Recorde
//
//     - parameter dictionary: 数据库中存储数据
//     */
//    func objectRepresentationWithDictionary(dictionary : [String : AnyObject])
}