//
//  CSPersistanceTable+update.swift
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

extension CSPersistanceTable {
    public func updateRecord(record: CSPersistanceRecordProtocol,condition: DatabaseCommandCondition) -> Bool {
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