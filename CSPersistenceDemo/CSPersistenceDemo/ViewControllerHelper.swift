//
//  ViewControllerHelper.swift
//  CSArchitecture
//
//  Created by 李长松 on 16/4/20.
//  Copyright © 2016年 Li. All rights reserved.
//

import Foundation

class ViewControllerHelper: NSObject {
    // 对应持久化处理
    var viewDataCenter: ViewControllerDataCenter?
    
    override init() {
        super.init()
        viewDataCenter = ViewControllerDataCenter()
        viewDataCenter?.testPersistance()
    }
}