//
//  MessageRecode.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/22.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation

class MessageRecode: CSPersistanceRecord {
    
    var message_id: NSNumber?
    var message_text: String?
    
    override init() {
        super.init()
    }
    
    init(id: NSNumber, text: String) {
        self.message_id = id
        self.message_text = text
        super.init()
    }
    
    override func dictionaryRepresentationInTable(table: CSPersistanceTableProtocol) -> [String : AnyObject]? {
        
        if table is MessageTable {
            return [
                "message_id": self.message_id!,
                "message_text": self.message_text!
            ]
        }
        return nil
    }
    override func dictionaryRepresentationUpdateInTable(table: CSPersistanceTableProtocol) -> [String : AnyObject]? {
        if table is MessageTable {
            return [
                "message_id": self.message_id!,
                "message_text": self.message_text!
            ]
        }
        return nil
    }
    
}
