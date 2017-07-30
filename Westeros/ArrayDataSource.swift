	//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Administrador on 20/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

    import UIKit
    
    final class ArrayDataSource<Element> : NSObject, UITableViewDataSource{
        
        typealias Elements = [Element]
        typealias CellMaker = (Element, UITableView)->UITableViewCell
        
        private let _model : Elements
        private let _cellMaker : CellMaker
        
        init(model: Elements, cellMaker: @escaping CellMaker){
            _model = model
            _cellMaker = cellMaker
            
            super.init()
        }
        
        func element(atIndexPath indexPath: IndexPath) -> Element{
            return _model[indexPath.row]
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return _model.count
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let elt = element(atIndexPath: indexPath)
            return _cellMaker(elt, tableView)
        }
        
        
        
    }
