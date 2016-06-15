//
//  CSPersistanceTable+update.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/21.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation

extension CSPersistanceTable {
    func updateRecord(record: CSPersistanceRecordProtocol,condition: DatabaseCommandCondition) -> Bool {
        guard let params = record.dictionaryRepresentationUpdateInTable(self.child!) else {
            return false
        }
        if params.count == 0 {
            return false
        }
        let queryCommand = CSPersistanceQueryCommand(name: child!.databaseName!)
        let sql = queryCommand.updateTable(self.child!.tableName, withCondition: condition, columnDic: params)
        return queryCommand.database(sql, withArgumentsInDictionary: nil)
    }

}