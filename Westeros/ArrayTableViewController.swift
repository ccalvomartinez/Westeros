//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Administrador on 20/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {
    
    let dataSource : ArrayDataSource<Element>
    
   private let myDelegate: ArrayTableViewDelegate<Element>
    
    init(dataSource: ArrayDataSource<Element>, arrayDelegate: ArrayTableViewDelegate<Element>, title: String, style: UITableViewStyle){
        
        self.dataSource = dataSource
        self.myDelegate = arrayDelegate
        super.init(style: style)
        self.title = title
        
        tableView.dataSource = self.dataSource
        arrayDelegate.setTableController(tableController: self)
        tableView.delegate = arrayDelegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
