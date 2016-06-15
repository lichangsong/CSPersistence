//
//  CSPersistanceTable+Find.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation
extension CSPersistanceTable {
    // 查询
    func fetchWithSQL(select: String?,condition: DatabaseCommandCondition) -> [CSPersistanceRecord]? {
        let queryCommand = CSPersistanceQueryCommand(name: child!.databaseName!)
        let sql = queryCommand.queryCommandWithTable(self.child!.tableName, select: select, condition: condition)
        let queryArray = queryCommand.database(sql, withArgumentsInArray: nil)
        
        return self.transformSQLItemsToClass(self.child!.recordClass, dataBaseArray: queryArray as? [[String:AnyObject]])
        
    }
}

