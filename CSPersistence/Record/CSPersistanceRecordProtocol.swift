//
//  CSPersistanceRecordProtocol.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation
protocol CSPersistanceRecordProtocol : NSObjectProtocol{
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
    
    /**
     将返回字典处理成Recorde
     
     - parameter dictionary: 数据库中存储数据
     */
    func objectRepresentationWithDictionary(dictionary : [String : AnyObject])
}