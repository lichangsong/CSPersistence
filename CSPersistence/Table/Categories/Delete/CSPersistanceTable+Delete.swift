//
//  CSPersistanceTable+Delete.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/21.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation
extension CSPersistanceTable {
    // 删除
    func deleteWithSQL(condition: DatabaseCommandCondition) -> Bool {
        
        let queryCommand = CSPersistanceQueryCommand(name: child!.databaseName!)
        let sql = queryCommand.deleteTable(self.child!.tableName, withCondition: condition)
        return queryCommand.database(sql, withArgumentsInDictionary: nil)
        
    }
}