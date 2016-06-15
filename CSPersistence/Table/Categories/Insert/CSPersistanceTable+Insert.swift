//
//  CSPersistanceTable+Insert.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/10.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation

extension CSPersistanceTable {
   
    func replaceRecord(record: CSPersistanceRecordProtocol) -> Bool {
        guard let params = record.dictionaryRepresentationInTable(self.child!) else {
            return false
        }
        if params.count == 0 {
            return false
        }
        guard let paramsColumn = record.arrayColumnInTable(self.child!) else {
            return false
        }
        if paramsColumn.count == 0 {
            return false
        }
        let queryCommand = CSPersistanceQueryCommand(name: child!.databaseName!)
        let sql = queryCommand.insertTable(self.child!.tableName, columnList: paramsColumn)
        return queryCommand.database(sql, withArgumentsInDictionary: params)
    }
    
}