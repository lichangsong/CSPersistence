//
//  ViewController.swift
//  CSPersistenceDemo
//
//  Created by 李长松 on 16/6/17.
//  Copyright © 2016年 Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewControllerHelper: ViewControllerHelper?
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        initHelper()
    }
    // 初始化Helper
    func initHelper() {
        viewControllerHelper = ViewControllerHelper()
    }
}

